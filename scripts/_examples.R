# EVR 628 - Example Code Demonstrations
# This script contains examples of key concepts covered in the course

# Load required packages
library(tidyverse)
library(sf)
library(terra)
library(mapview)
library(viridis)
library(gganimate)
library(gifski)
library(transformr)

# 1. Data Visualization Examples --------------------------------------------

# Example 1: Basic ggplot2 visualization with environmental data
# Create sample temperature data
temp_data <- data.frame(
  month = factor(month.abb, levels = month.abb),
  temperature = c(20, 22, 25, 28, 30, 32, 33, 32, 30, 27, 23, 21)
)

# Create a line plot following Tufte's principles
ggplot(temp_data, aes(x = month, y = temperature)) +
  geom_line(color = viridis(1)) +
  geom_point(color = viridis(1)) +
  theme_minimal() +
  labs(
    title = "Monthly Average Temperature",
    x = "Month",
    y = "Temperature (°C)"
  ) +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

# 2. Data Management Examples ---------------------------------------------

# Example 2: Data transformation with dplyr
# Create sample fisheries catch data
fisheries_data <- data.frame(
  year = rep(2020:2022, each = 4),
  season = rep(c("Spring", "Summer", "Fall", "Winter"), 3),
  species = rep(c("Tuna", "Salmon"), 6),
  catch = round(runif(12, 100, 1000))
)

# Demonstrate data transformation
fisheries_summary <- fisheries_data %>%
  group_by(year, species) %>%
  summarise(
    total_catch = sum(catch),
    avg_catch = mean(catch),
    .groups = "drop"
  )

# 3. Spatial Data Examples -----------------------------------------------

# Example 3: Working with spatial data
# Create a simple polygon for a marine protected area
mpa_coords <- matrix(
  c(-80.2, 25.8,
    -80.1, 25.8,
    -80.1, 25.7,
    -80.2, 25.7,
    -80.2, 25.8),
  ncol = 2,
  byrow = TRUE
)

# Create an sf object
mpa_sf <- st_polygon(list(mpa_coords)) %>%
  st_sfc(crs = 4326) %>%
  st_sf(name = "Example MPA")

# Visualize using mapview
mapview(mpa_sf, 
        col.regions = viridis(1),
        alpha.regions = 0.3)

# 4. Data Tidying Example ------------------------------------------------

# Example 4: Data tidying with tidyr
# Create wide format data
wide_data <- data.frame(
  site = c("Site1", "Site2", "Site3"),
  temp_2020 = c(25, 26, 24),
  temp_2021 = c(26, 27, 25),
  temp_2022 = c(27, 28, 26)
)

# Convert to long format
long_data <- wide_data %>%
  pivot_longer(
    cols = starts_with("temp_"),
    names_to = "year",
    names_prefix = "temp_",
    values_to = "temperature"
  )

# 5. Date/Time Handling Example ------------------------------------------

# Example 5: Working with dates using lubridate
# Create sample time series data
time_data <- data.frame(
  datetime = seq(
    from = as.POSIXct("2023-01-01 00:00:00"),
    to = as.POSIXct("2023-01-01 23:00:00"),
    by = "hour"
  ),
  measurement = runif(24, 0, 100)
)

# Extract time components
time_data <- time_data %>%
  mutate(
    hour = hour(datetime),
    day = day(datetime),
    month = month(datetime),
    year = year(datetime)
  )

# 6. Animated Visualization Example --------------------------------------

# Example 6: Animated visualization of Hurricane Milton's track
# Read the hurricane track data
milton_track <- st_read("data/raw/milton.gpkg")

# Create a base map of Florida and surrounding areas
florida_bbox <- st_bbox(c(
  xmin = -88, xmax = -75,
  ymin = 24, ymax = 32
), crs = 4326)

# Create the animation
milton_animation <- ggplot() +
  # Add base map
  geom_sf(data = st_as_sfc(florida_bbox), fill = "lightblue", alpha = 0.3) +
  # Add hurricane track
  geom_path(data = milton_track, 
            aes(x = st_coordinates(.)[,1], 
                y = st_coordinates(.)[,2]),
            color = "red", 
            size = 1) +
  # Add points for each position
  geom_point(data = milton_track,
             aes(x = st_coordinates(.)[,1],
                 y = st_coordinates(.)[,2],
                 size = wind_speed),
             color = "red",
             alpha = 0.6) +
  # Customize the animation
  scale_size_continuous(name = "Wind Speed (knots)") +
  coord_sf(xlim = c(-88, -75), ylim = c(24, 32)) +
  theme_minimal() +
  labs(title = "Hurricane Milton Track",
       x = "Longitude",
       y = "Latitude") +
  # Add animation
  transition_reveal(along = datetime) +
  ease_aes('linear') +
  # Customize theme
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "bottom"
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
