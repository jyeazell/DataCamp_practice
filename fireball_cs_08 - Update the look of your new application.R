##'Update the look of your new application
##'
##'Now let's put it all together. You have created an application for viewing 
##'fireball locations. The full application is shown in the sample code. Update 
##'the skin of the dashboard page to a color of your choosing.


library("leaflet")

server <- function(input, output) {
    output$plot <- renderLeaflet({
        leaflet() %>%
            addTiles() %>%  
            addCircleMarkers(
                lng = nasa_fireball$lon,
                lat = nasa_fireball$lat, 
                radius = log(nasa_fireball$impact_e), 
                label = nasa_fireball$date, 
                weight = 2)
    })
}

body <- dashboardBody(
    fluidRow(
        valueBox(
            value = max_energy, 
            subtitle = "Maximum total radiated energy (Joules)", 
            icon = icon("lightbulb-o")
        ),
        valueBox(
            value = max_impact_e, 
            subtitle = "Maximum impact energy (kilotons of TNT)",
            icon = icon("star")
        ),
        valueBox(
            value = max_vel,
            subtitle = "Maximum pre-impact velocity", 
            icon = icon("fire")
        )
    ),
    fluidRow(
        leafletOutput("plot")
    )
)


ui <- dashboardPage(
    skin = "green",
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    body = body
)

shinyApp(ui, server)
