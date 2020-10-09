##' Putting it all Together
##' Let's try putting this all together at one time. Building our interactive 
##' map of every four-year college in America can be broken down into four 
##' steps:
##' 
##' 1. Initialize the web map
##' 2. Lay down our base maps
##' 3. Plot each sector of colleges as its own layer
##' 4. Add layer controls so users can toggle base and overlay groups
##' 
##' The public, private, and profit data frames as well as the color palette 
##' pal have been loaded for you.



library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(htmltools)

ipeds <- read_csv("./data_sets/ipeds.csv")

pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

#########################################

# Create sector groups.
public <- filter(ipeds, sector_label == "Public")
private <- filter(ipeds, sector_label == "Private")
profit <- filter(ipeds, sector_label == "For-Profit")

m4 <- leaflet() %>% 
  addTiles(group = "OSM") %>% 
  addProviderTiles("CartoDB", group = "Carto") %>% 
  addProviderTiles("Esri", group = "Esri") %>% 
  addCircleMarkers(data = public, radius = 2, label = ~htmlEscape(name),
                   color = ~pal(sector_label),  group = "Public") %>% 
  addCircleMarkers(data = private, radius = 2, label = ~htmlEscape(name),
                   color = ~pal(sector_label), group = "Private")  %>% 
  addCircleMarkers(data = profit, radius = 2, label = ~htmlEscape(name),
                   color = ~pal(sector_label), group = "For-Profit")  %>% 
  addLayersControl(baseGroups = c("OSM", "Carto", "Esri"), 
                   overlayGroups = c("Public", "Private", "For-Profit")) %>% 
  setView(lat = 39.8282, lng = -98.5795, zoom = 4) 

m4
