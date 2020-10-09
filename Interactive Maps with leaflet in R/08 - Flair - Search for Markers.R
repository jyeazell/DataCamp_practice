##' Adding a Piece of Flair
##' 
##' Earlier in this chapter, we used addSearchOSM() to find the middle of the 
##' US. To search for markers, rather than locations, we can use the 
##' addSearchFeatures() function. addSearchFeatures() will add a search box 
##' that you can use to find markers in the group(s) passed to the targetGroups 
##' argument. For example, to search our map for public colleges we could use 
##' the following code.
##' 
##' m4  %>% 
##'   addSearchFeatures(targetGroups = 'Public',
##'                     options = searchFeaturesOptions(zoom = 10))
##' 
##' The m4 map and the leaflet.extras package have been loaded for you.



library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(htmltools)

ipeds <- read_csv("./data_sets/ipeds.csv")

pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

#########################################

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

# Make each sector of colleges searchable 
m4_search <- m4  %>% 
  addSearchFeatures(
    targetGroups = c("Public", "Private", "For-Profit"), 
    # Set the search zoom level to 18
    options = searchFeaturesOptions(zoom = 18)) 

# Try searching the map for a college
m4_search
