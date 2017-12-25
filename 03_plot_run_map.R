# Plot activities as small multiples

# Load packages
library(ggart) # devtools::install_github("marcusvolz/ggart")
library(tidyverse)

# Read in pre-processed data
data <- readRDS("processed/data.RDS")

# Specify lat / lon window
lon_min <- -79.506569
lon_max <- -79.288095
lat_min <- 43.608261
lat_max <- 43.730978

# Create plot
p <- ggplot() +
  geom_path(aes(lon, lat, group = id),
            data %>% filter(lon > lon_min, lon < lon_max, lat < abs(lat_max), lat > abs(lat_min)),
            alpha = 0.3, size = 0.3, lineend = "round") +
  coord_equal() +
  theme_blankcanvas(margin_cm = 0)

# Save plot
ggsave("plots/map001.png", p, width = 20, height = 15, units = "cm", dpi = 600)

# toronto info:
# bottom left: 43.608261, -79.467152
# top left: 43.684656, -79.506569
# top right: 43.730978, -79.306468
# bottom right: 43.635963, -79.288095