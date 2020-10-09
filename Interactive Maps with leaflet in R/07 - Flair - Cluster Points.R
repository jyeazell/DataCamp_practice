##' AA Cluster Approach
##' 
##' Rather than using layers to improve the usability of our map, we could 
##' elect to cluster the colleges by clustering groups of nearby colleges 
##' together to reduce the number of points on the map. Zooming in will cause 
##' the clusters to break apart and the individual colleges to appear. This can 
##' be a useful tactic for mapping a large number of points in a user-friendly manner.
##' 
##' We can cluster all of our colleges by setting the clusterOptions argument 
##' of addCircleMarkers() as follows.
##' 
##' ipeds %>% 
##'   leaflet() %>%
##'   addTiles() %>% 
##'   addCircleMarkers(clusterOptions = markerClusterOptions())
##'   
##'   The ipeds data, htmltools library, and color palette pal have been 
##'   loaded for you.



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
#########################################


ipeds %>% 
  leaflet() %>% 
  addTiles() %>% 
  # Sanitize any html in our labels
  addCircleMarkers(radius = 2, label = ~htmlEscape(name),
                   # Color code colleges by sector using the `pal` color palette
                   color = ~pal(sector_label),
                   # Cluster all colleges using `clusterOptions`
                   clusterOptions = markerClusterOptions()) 
