##'Create a dynamic plot of the location of fireballs
##'
##'Rather than just examining how many fireballs have landed in the United 
##'States, you can plot each of the fireballs on a map! Here is some example 
##'code, for an example data set named df we can plot the fireball incidents 
##'as circles with the radius of the circle based on the velocity.

# output$plot <- renderLeaflet({
#     leaflet() %>%
#         addTiles() %>%  
#         addCircleMarkers(lng = df$lon, 
#                          lat = df$lat, 
#                          radius = df$vel, label =
#                              df$date, 
#                          weight = 3)
# })

##'This code belongs in the server function. Using code similar to that above 
##'with the nasa_fireball data frame, create a plot of the fireball events with 
##'the radius equal to the log of the impact energy. To remove any warnings, I 
##'have subset the nasa_fireball data frame to remove any rows missing latitude 
##'or longitude.

library("leaflet")

server <- function(input, output) {
    output$plot <- renderLeaflet({
        leaflet() %>%
            addTiles() %>%  
            addCircleMarkers(lng = nasa_fireball$lon, 
                             lat = nasa_fireball$lat, 
                             radius = log(nasa_fireball$impact_e), 
                             label = nasa_fireball$date, 
                             weight = 2)
    })
}

body <- dashboardBody( 
    leafletOutput("plot")
)

ui <- dashboardPage(
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    body = body
)

shinyApp(ui, server)
