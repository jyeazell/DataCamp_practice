##' Change up the Base
##' 
##' Similar to how we added overlay groups (i.e., college sectors), we can 
##' allow our users to toggle between different base maps using the baseGroups 
##' argument to the addLayersControl() function.
##' First we will need to add multiple basemaps and specify the name of a group 
##' for each.
##' leaflet() %>% 
##'   addTiles(group = "OSM") %>% 
##'   addProviderTiles("CartoDB", group = "CartoDB") 
##'   
##'   Try running the above code in the console. You should see a leaflet map 
##'   in the viewer with the CartoDB basemap. This is because we added the 
##'   CartoDB base map after the default OpenStreetMap tile. If we add 
##'   addLayerControl(), our users will be able to toggle between the two base 
##'   maps (you can include many base maps, but only one can be selected at a 
##'   time).
##'   



library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(htmltools)

ipeds <- read_csv("./data_sets/ipeds.csv")

pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

#########################################

leaflet() %>% 
  # Add the OSM, CartoDB and Esri tiles
  addTiles(group = "OSM") %>% 
  addProviderTiles("CartoDB", group = "CartoDB") %>% 
  addProviderTiles("Esri", group = "Esri") %>% 
  # Use addLayersControl to allow users to toggle between basemaps
  addLayersControl(baseGroups = c("OSM", "CartoDB", "Esri"))
