# Hurricane Milton Track Animation
# This script creates an animated visualization of Hurricane Milton's track
# using gganimate and related packages.

# Load required packages
library(tidyverse)
library(sf)
library(gganimate)
library(gifski)
library(transformr)
library(viridis)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggthemes)

# Read the hurricane track data
milton_track <- st_read("data/raw/milton.gpkg")

# Get US and Mexico state boundaries from natural earth
us_states <- ne_states(country = "United States of America", returnclass = "sf") %>%
  st_transform(4326)

mexico_states <- ne_states(country = "Mexico", returnclass = "sf") %>%
  st_transform(4326)

# Get Belize and Guatemala country boundaries
belize <- ne_countries(country = "Belize", returnclass = "sf") %>%
  st_transform(4326)

guatemala <- ne_countries(country = "Guatemala", returnclass = "sf") %>%
  st_transform(4326)

# Combine US, Mexico, Belize, and Guatemala
coastal_states <- rbind(us_states, mexico_states, belize, guatemala)

# Create the animation
milton_animation <- ggplot() +
  # Add coastal states boundaries
  geom_sf(data = coastal_states, 
          fill = "#E6E6E6",  # Light gray fill
          color = "#808080", # Dark gray border
          size = 0.5) +
  # Add hurricane track
  geom_path(data = milton_track, 
            aes(x = st_coordinates(milton_track)[,1], 
                y = st_coordinates(milton_track)[,2]),
            color = "#E3120B", # Economist red
            size = 1) +
  # Add points for each position
  geom_point(data = milton_track,
             aes(x = st_coordinates(milton_track)[,1],
                 y = st_coordinates(milton_track)[,2],
                 size = USA_WIND),
             color = "#E3120B", # Economist red
             alpha = 0.8) +
  # Customize the animation
  scale_size_continuous(name = "Wind Speed (knots)") +
  # Adjust the map extent to show all coastal states
  coord_sf(xlim = c(-100, -65), ylim = c(15, 45)) +
  theme_economist() +  # Use Economist theme
  labs(title = "Track for Hurricane Milton",
       subtitle = "Wind speed and movement pattern",
       x = "Longitude",
       y = "Latitude") +
  # Add animation
  transition_reveal(along = ISO_TIME) +
  ease_aes('linear') +
  # Customize theme further
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 12, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "bottom",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9),
    panel.grid.major = element_line(color = "gray90", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Save the animation
animate(milton_animation,
        width = 800,
        height = 600,
        fps = 10,
        duration = 10,
        renderer = gifski_renderer(),
        res = 120)

# Save to file
anim_save("hurricane_milton_track.gif") 
