# Gulf of Mexico Fishing Effort Analysis
# This script creates a single map showing total fishing effort in the Gulf of Mexico for 2024.

# Load required packages
library(tidyverse)
library(gfwr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(viridis)
library(ggthemes)

# Create an sf object that outlines the Gulf of Mexico region
# Define the bounding box for the Gulf of Mexico
gom_bbox <- c(
  xmin = -98, xmax = -80,
  ymin = 18, ymax = 31
)

# Create a polygon for the Gulf of Mexico
gom_polygon <- st_polygon(list(
  matrix(
    c(
      gom_bbox["xmin"], gom_bbox["ymin"], # Southwest corner
      gom_bbox["xmax"], gom_bbox["ymin"], # Southeast corner
      gom_bbox["xmax"], gom_bbox["ymax"], # Northeast corner
      gom_bbox["xmin"], gom_bbox["ymax"], # Northwest corner
      gom_bbox["xmin"], gom_bbox["ymin"]  # Close the polygon
    ),
    ncol = 2,
    byrow = TRUE
  )
))

# Convert to sf object with proper CRS
gom_sf <- st_sf(
  name = "Gulf of Mexico",
  geometry = st_sfc(gom_polygon),
  crs = 4326
)

# Set up authentication for Global Fishing Watch API
# Note: You need to register at https://globalfishingwatch.org/our-apis/
# and obtain an API key
api_key <- Sys.getenv("GFW_TOKEN")
if (api_key == "") {
  stop("Please set your Global Fishing Watch API key as an environment variable: GFW_API_KEY")
}

# Define the time period (2024)
start_date <- "2024-01-01"
end_date <- "2024-12-31"

# Use the get_raster function to fetch fishing effort data
effort_raster <- get_raster(
  key = api_key,
  start_date = start_date,
  end_date = end_date,
  spatial_resolution = "LOW",
  temporal_resolution = "MONTHLY",
  region_source = "USER_SHAPEFILE", 
  region = gom_sf
)

# Convert raster to data frame for easier manipulation
effort_df <- effort_raster |> 
  janitor::clean_names() |> 
  mutate(
    date = ymd(paste(time_range, "-01")),
    month = month(date),
    month_name = month(date, label = TRUE, abbr = TRUE)
  ) |> 
  rename(fishing_hours = apparent_fishing_hours)

# Get base map data for the Gulf of Mexico
# Get country boundaries with higher resolution
countries <- ne_countries(scale = "large", returnclass = "sf") %>%
  st_transform(crs = 4326)

# Filter for countries around the Gulf of Mexico
gom_countries <- countries %>%
  filter(name %in% c("United States of America", "Mexico", "Cuba"))

# Get US states for more detailed coastline
us_states <- ne_states(country = "United States of America", returnclass = "sf") %>%
  st_transform(crs = 4326)

# Filter for states along the Gulf of Mexico
gulf_states <- us_states %>%
  filter(name %in% c("Florida", "Alabama", "Mississippi", "Louisiana", "Texas"))

# Aggregate the data to create a single map for the entire year
yearly_effort <- effort_df %>%
  group_by(lon, lat) %>%
  summarise(
    total_fishing_hours = sum(fishing_hours, na.rm = TRUE)
  ) %>%
  ungroup()

# Create a single map showing total fishing effort for the entire year
total_effort_map <- ggplot() +
  # Base map - countries
  geom_sf(data = gom_countries, fill = "lightgray", color = "gray50") +
  # US states along the Gulf
  geom_sf(data = gulf_states, fill = "lightgray", color = "gray50") +
  # Gulf of Mexico outline
  geom_sf(data = gom_sf, fill = NA, color = "blue", linetype = "dashed", size = 1) +
  # Fishing effort tiles
  geom_tile(data = yearly_effort, 
            aes(x = lon, y = lat, fill = total_fishing_hours),
            alpha = 0.8) +
  # Color scale
  scale_fill_viridis_c(
    name = "Total Fishing Hours (2024)",
    option = "plasma",
    trans = "log10",
    labels = scales::comma
  ) +
  # Map extent - slightly expanded to show more of the US
  coord_sf(
    xlim = c(gom_bbox["xmin"] - 1, gom_bbox["xmax"] + 1),
    ylim = c(gom_bbox["ymin"] - 1, gom_bbox["ymax"] + 1)
  ) +
  # Theme
  theme_economist() +
  # Labels
  labs(
    title = "Total Fishing Effort in the Gulf of Mexico",
    subtitle = "Or is it all?",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 12, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "right",
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 9),
    panel.grid.major = element_line(color = "gray90", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Save the map
ggsave(
  "gom_fishing_effort_2024_total.png",
  total_effort_map,
  width = 12,
  height = 8,
  dpi = 300
)

# Print a summary of the total fishing effort
total_summary <- yearly_effort %>%
  summarise(
    total_fishing_hours = sum(total_fishing_hours, na.rm = TRUE),
    mean_fishing_hours = mean(total_fishing_hours, na.rm = TRUE),
    max_fishing_hours = max(total_fishing_hours, na.rm = TRUE)
  )

print("Total Fishing Effort Summary for 2024:")
print(total_summary) 
