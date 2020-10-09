##' Mapping Public and Private Colleges
##' 
##' We can add private colleges exactly how we added public colleges. Then 
##' using the addLayersControl() function with the overlayGroups argument we 
##' can give our users the ability to display public and/or private colleges. 
##' The overlayGroups argument takes a vector of groups that we have defined 
##' while creating our layers (i.e., public and private). As a reminder, here 
##' is how we can add public colleges to our map as a layer:
##' # Create data frame called public with only public colleges
##' public <- filter(ipeds, sector_label == "Public") 
##' 
##' # Add public colleges as a layer and save map as `m3`
##' m3 <- leaflet() %>% 
##'   addProviderTiles("CartoDB") %>% 
##'   addCircleMarkers(data = public, radius = 2,
##'                    label = ~htmlEscape(name),
##'   color = ~pal(sector_label),
##'   group = "Public") %>% 
##'   addLayersControl(overlayGroups = c("Public"))
##' 
##' The htmltools library, color palette pal and the m3 map with public 
##' colleges have been loaded for you.

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

m3
