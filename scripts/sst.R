# Sea Surface Temperature Analysis for Biscayne National Park
# This script fetches SST data from NOAA's ERDDAP server and creates
# a visualization showing monthly trends by year from 1983 to present.

# Load required packages
library(tidyverse)
library(rerddap)
library(ncdf4)
library(lubridate)
library(ggthemes)
library(scales)
library(gganimate)
library(gifski)
library(transformr)
library(sf)

# Define the region of interest (Biscayne National Park)
# Biscayne National Park coordinates: approximately 25.4°N to 25.9°N, 80.3°W to 80.1°W
biscayne_park_bbox <- c(
  xmin = -80.3, xmax = -80.1,
  ymin = 25.4, ymax = 25.9
)

# Function to fetch SST data from ERDDAP
fetch_sst_data <- function(start_date, end_date) {
  # Use the NOAA OI SST v2 dataset with coarser resolution (1 degree)
  # This is a lower-resolution dataset available from 1981 to present
  sst_info <- info('ncdcOisst2Agg1_LonPM180')
  
  # Extract data for Biscayne National Park region
  sst_data <- griddap(
    sst_info,
    latitude = c(biscayne_park_bbox["ymin"], biscayne_park_bbox["ymax"]),
    longitude = c(biscayne_park_bbox["xmin"], biscayne_park_bbox["xmax"]),
    time = c(start_date, end_date),
    fmt = "nc"
  )
  
  return(sst_data)
}

# Function to process the SST data
process_sst_data <- function(sst_data) {
  # Extract the data from the NetCDF file
  nc <- nc_open(sst_data$summary$filename)
  
  # Get dimensions
  lon <- ncvar_get(nc, "longitude")
  lat <- ncvar_get(nc, "latitude")
  time <- ncvar_get(nc, "time")
  
  # Get SST values
  sst_values <- ncvar_get(nc, "sst")
  
  # Close the NetCDF file
  nc_close(nc)
  
  # Convert time to dates
  time_dates <- as.Date(time, origin = "1970-01-01")
  
  # Calculate mean SST for each time point
  mean_sst <- apply(sst_values, 3, mean, na.rm = TRUE)
  
  # Create a data frame
  sst_df <- data.frame(
    date = time_dates,
    sst = mean_sst
  )
  
  # Add month and year columns
  sst_df <- sst_df %>%
    mutate(
      month = month(date),
      year = year(date),
      month_name = month(date, label = TRUE, abbr = TRUE)
    )
  
  return(sst_df)
}

# Fetch data from 1983 to present
# Note: ERDDAP has limitations on data size, so we'll fetch in chunks
# and combine them

# Define time chunks (5-year periods)
time_chunks <- list(
  c("1983-01-01", "1987-12-31"),
  c("1988-01-01", "1992-12-31"),
  c("1993-01-01", "1997-12-31"),
  c("1998-01-01", "2002-12-31"),
  c("2003-01-01", "2007-12-31"),
  c("2008-01-01", "2012-12-31"),
  c("2013-01-01", "2017-12-31"),
  c("2018-01-01", "2023-12-31")
)

# Initialize an empty list to store data frames
sst_data_list <- list()

# Fetch and process data for each time chunk
for (i in seq_along(time_chunks)) {
  chunk <- time_chunks[[i]]
  message(sprintf("Fetching data for %s to %s", chunk[1], chunk[2]))
  
  # Fetch data
  sst_data <- fetch_sst_data(chunk[1], chunk[2])
  
  # Process data
  sst_df <- process_sst_data(sst_data)
  
  # Add to list
  sst_data_list[[i]] <- sst_df
}

# Combine all data frames
sst_all <- bind_rows(sst_data_list)

# Create the static visualization
sst_plot <- ggplot(sst_all, aes(x = month, y = sst, color = factor(year))) +
  geom_line(size = 0.8) +
  geom_point(size = 1.5, alpha = 0.7) +
  scale_x_continuous(breaks = 1:12, labels = month.abb) +
  scale_y_continuous(
    name = "Sea Surface Temperature (°C)",
    limits = c(20, 32),
    breaks = seq(20, 32, by = 2)
  ) +
  scale_color_viridis_d(name = "Year", option = "plasma") +
  theme_economist() +
  labs(
    title = "Sea Surface Temperature in Biscayne National Park",
    subtitle = "Monthly trends by year (1983-present)",
    x = "Month"
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

# Save the static plot
ggsave("biscayne_park_sst_trends.png", sst_plot, width = 12, height = 8, dpi = 300)

# Print the static plot
print(sst_plot)

# Create an animated version of the plot
# First, prepare the data for animation by creating a cumulative dataset
sst_animation_data <- sst_all %>%
  arrange(date) %>%
  group_by(year) %>%
  mutate(
    # Create a cumulative dataset for each year
    cumulative = TRUE,
    # Add a frame number for animation
    frame = row_number()
  ) %>%
  ungroup()

# Create the animated plot
sst_animation <- ggplot(sst_animation_data, aes(x = month, y = sst, color = factor(year))) +
  geom_line(size = 0.8) +
  geom_point(size = 1.5, alpha = 0.7) +
  scale_x_continuous(breaks = 1:12, labels = month.abb) +
  scale_y_continuous(
    name = "Sea Surface Temperature (°C)",
    limits = c(20, 32),
    breaks = seq(20, 32, by = 2)
  ) +
  scale_color_viridis_d(name = "Year", option = "plasma") +
  theme_economist() +
  labs(
    title = "Sea Surface Temperature in Biscayne National Park",
    subtitle = "Monthly trends by year (1983-present)",
    x = "Month"
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
  ) +
  # Add animation
  transition_reveal(along = date) +
  # Add a shadow to show the path
  shadow_mark(alpha = 0.3, size = 0.5)

# Save the animation
anim_save(
  "biscayne_park_sst_animation.gif",
  sst_animation,
  width = 800,
  height = 600,
  fps = 10,
  duration = 10,
  renderer = gifski_renderer(),
  res = 120
)

# Create a second animation showing the trend over time
trend_animation <- ggplot(sst_all, aes(x = date, y = sst)) +
  geom_point(size = 1, alpha = 0.5) +
  geom_smooth(method = "loess", color = "#E3120B", size = 1.5) +
  scale_y_continuous(
    name = "Sea Surface Temperature (°C)",
    limits = c(20, 32),
    breaks = seq(20, 32, by = 2)
  ) +
  theme_economist() +
  labs(
    title = "Sea Surface Temperature Trend in Biscayne National Park",
    subtitle = "1983-present with trend line",
    x = "Year"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 12, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", size = 0.2),
    panel.grid.minor = element_blank()
  ) +
  # Add animation
  transition_reveal(along = date) +
  # Add a shadow to show the path
  shadow_mark(alpha = 0.3, size = 0.5)

# Save the trend animation
anim_save(
  "biscayne_park_sst_trend_animation.gif",
  trend_animation,
  width = 800,
  height = 600,
  fps = 10,
  duration = 10,
  renderer = gifski_renderer(),
  res = 120
)

# Create a map visualization of the park with SST data
# Get the park boundary from Natural Earth
library(rnaturalearth)
library(rnaturalearthdata)

# Get US state boundaries
us_states <- ne_states(country = "United States of America", returnclass = "sf") %>%
  st_transform(crs = 4326)

# Filter for Florida
florida <- us_states %>%
  filter(name == "Florida")

# Create a simple map of the park region
park_map <- ggplot() +
  geom_sf(data = florida, fill = "lightgray", color = "gray50") +
  geom_rect(
    aes(
      xmin = biscayne_park_bbox["xmin"],
      xmax = biscayne_park_bbox["xmax"],
      ymin = biscayne_park_bbox["ymin"],
      ymax = biscayne_park_bbox["ymax"]
    ),
    fill = "lightblue",
    alpha = 0.5,
    color = "blue"
  ) +
  coord_sf(
    xlim = c(biscayne_park_bbox["xmin"] - 0.5, biscayne_park_bbox["xmax"] + 0.5),
    ylim = c(biscayne_park_bbox["ymin"] - 0.5, biscayne_park_bbox["ymax"] + 0.5)
  ) +
  theme_economist() +
  labs(
    title = "Biscayne National Park Region",
    subtitle = "Study area for sea surface temperature analysis",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 12, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Save the map
ggsave("biscayne_park_map.png", park_map, width = 8, height = 8, dpi = 300)

# Additional analysis: Calculate annual means
annual_means <- sst_all %>%
  group_by(year) %>%
  summarise(
    mean_sst = mean(sst, na.rm = TRUE),
    min_sst = min(sst, na.rm = TRUE),
    max_sst = max(sst, na.rm = TRUE)
  )

# Print annual means
print(annual_means)

# Calculate decadal trends
decadal_means <- sst_all %>%
  mutate(decade = floor(year / 10) * 10) %>%
  group_by(decade) %>%
  summarise(
    mean_sst = mean(sst, na.rm = TRUE),
    min_sst = min(sst, na.rm = TRUE),
    max_sst = max(sst, na.rm = TRUE)
  )

# Print decadal means
print(decadal_means)

# Create a decadal comparison plot
decadal_plot <- ggplot(decadal_means, aes(x = factor(decade), y = mean_sst)) +
  geom_bar(stat = "identity", fill = "#E3120B", alpha = 0.8) +
  geom_errorbar(
    aes(ymin = min_sst, ymax = max_sst),
    width = 0.2,
    color = "gray50"
  ) +
  scale_y_continuous(
    name = "Sea Surface Temperature (°C)",
    limits = c(20, 32),
    breaks = seq(20, 32, by = 2)
  ) +
  theme_economist() +
  labs(
    title = "Decadal Sea Surface Temperature in Biscayne National Park",
    subtitle = "1983-present",
    x = "Decade"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0),
    plot.subtitle = element_text(size = 12, hjust = 0),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Save the decadal plot
ggsave("biscayne_park_sst_decadal.png", decadal_plot, width = 10, height = 6, dpi = 300)

