##' Building a Base
##' 
##' Now that we know where to center our map (Lat = 39.8282, Lng = -98.5795), 
##' let's build a new basemap. Remember that we can use either addTiles() or 
##' addProviderTiles() to add a map tile to our leaflet object.
##' 
##' Since we are working toward mapping all of America's colleges, we can 
##' include the ipeds data at the start of the chain of functions that will 
##' create our base map. This way the ipeds data will be stored with our base 
##' map so that we can easily access it. Once we have built a solid base, we 
##' can map every college in America with just two lines of R code.
##' 
##' The ipeds data and leaflet and tidyverse libraries have been loaded for you.

library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)

ipeds <- read_csv("./data_sets/ipeds.csv")

m2 <- ipeds %>% 
  leaflet() %>% 
  # use the CartoDB provider tile
  addProviderTiles("CartoDB") %>% 
  # center on the middle of the US with zoom of 3
  setView(lat = 39.8282, 
          lng = -98.5795, 
          zoom = 3)

m2 %>% addCircleMarkers() 

##' Down South
##' 
##' Building a solid base has set us up to map every college with just a few 
##' lines of code. Run the following in the console and explore the map to 
##' determine which college is the southernmost public college in the 
##' continental (i.e., mainland) US.

pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

m2 %>% 
  addCircleMarkers(radius = 2, label = ~name, color = ~pal(sector_label))
