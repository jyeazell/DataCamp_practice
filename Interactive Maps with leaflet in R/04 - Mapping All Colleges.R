##' Mapping All Colleges
##' 
##' Let's keep layering up and add for-profit colleges to our leaflet map that 
##' is stored in the m3 object. After you print() the m3 map with public, 
##' private, and for-profit colleges as their own layers, then try removing 
##' all three layers and adding them back to the map in a different order. 
##' 
##' The different college sectors are added back to the map as layers in the 
##' order you specify (i.e., the last sector that you select will be on top).
##' 
##' The color palette pal and the m3 map with public and private colleges have 
##' been loaded for you.

library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(htmltools)

ipeds <- read_csv("./data_sets/ipeds.csv")

pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

# Create data frame called public with only public colleges
public <- filter(ipeds, sector_label == "Public")  

# Create a leaflet map of public colleges called m3 
m3 <- leaflet() %>% 
  addProviderTiles("CartoDB") %>% 
  addCircleMarkers(data = public, radius = 2, label = ~htmlEscape(name),
                   color = ~pal(sector_label), group = "Public")

# Create data frame called private with only private colleges
private <- filter(ipeds, sector_label == "Private")  

# Add private colleges to `m3` as a new layer
m3 <- m3 %>% 
  addCircleMarkers(data = private, radius = 2, label = ~htmlEscape(name),
      color = ~pal(sector_label), group = "Private") %>% 
  addLayersControl(overlayGroups = c("Public", "Private"))


# Create data frame called profit with only For-Profit colleges
profit <- filter(ipeds, sector_label == "For-Profit")  

# Add For-Profit colleges to `m3` as a new layer
m3 <- m3 %>% 
  addCircleMarkers(data = profit, radius = 2, label = ~htmlEscape(name),
                   color = ~pal(sector_label),   group = "For-Profit")  %>% 
  addLayersControl(overlayGroups = c("Public", "Private", "For-Profit"))  

# Center the map on the middle of the US with a zoom of 4
m4 <- m3 %>%
  setView(lat = 39.8282, lng = -98.5795, zoom = 4) 

m4
m3
