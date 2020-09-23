##' Middle America
##' 
##' Starting from scratch, our first step is to create a base map and to set our
##' map's view. Rather than using the geocode() function from ggmaps, we'll add
##' an extra feature to our map so we can use the map to geocode.
##' 
##' After creating the map in Step 1, search for "U.S. Center Chapel " in Kansas
##' and click the marker to add a pin.
##' 
##' When you hover over the pin what are the coordinates?

library(leaflet)
library(leaflet.extras)


leaflet() %>%
    addTiles() %>% 
    addSearchOSM() %>% 
    addReverseSearchOSM() 
