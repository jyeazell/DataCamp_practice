##' AaddPolygons() Function
##' 
##' Let's look at those zip codes with missing data to hypothesize why they do 
##' not have income data.
##' 
##' We are mapping ZCTAs (not actual zip codes) so not every part of NC will 
##' have a boundary. Our boundaries may overlap because the file was simplified 
##' to reduce size. These are trade offs to consider when mapping polygons.
##' 
##' Enough nuance, let's make a map. You can pipe the shp data directly into 
##' our calls to leaflet(), addTiles(), and addPolygons() without supplying any 
##' additional arguments to map North Carolina's zip codes. To get you started, 
##' the shp SpatialPolygonsDataFrame including the IRS income variables has 
##' been loaded for you.


library(sp)
library(dplyr)
library(readr)
library(leaflet)
library(leaflet.extras)
library(htmltools)
library(scales)

#load("./Interactive Maps with leaflet in R/data_sets/nc_zips.Rda")
load("./Interactive Maps with leaflet in R/data_sets/wealthiest_zips.Rda")
#read_csv("./Interactive Maps with leaflet in R/data_sets/mean_income_by_zip_nc.csv")
shp <- wealthy_zips
#########################################

# map the polygons in shp
shp %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons()

# summarize the mean income variable
summary(shp$mean_income)

# subset shp to include only zip codes in the top quartile of mean income
high_inc <- shp[!is.na(shp$mean_income) & shp$mean_income > 371904,]


# create color palette with colorNumeric()
nc_pal <- colorNumeric("YlGn", domain = high_inc@data$mean_income)

# Use the log function to create a new version of nc_pal
nc_pal <- colorNumeric("YlGn", domain = high_inc@data$mean_income)

# comment out the map tile
high_inc %>%
  leaflet() %>%
  #addProviderTiles("CartoDB") %>%
  # apply the new nc_pal to the map
  addPolygons(weight = 1, 
              color = ~nc_pal(log(high_inc@data$mean_income)), 
              fillOpacity = 1,
              label = ~paste0("Mean Income: ", dollar(mean_income)),
              highlightOptions = highlightOptions(weight = 5, color = "white", bringToFront = TRUE))
