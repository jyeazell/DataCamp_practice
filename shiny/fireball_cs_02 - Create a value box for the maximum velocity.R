##'Create a value box for the maximum velocity
##'
##'Now you can begin building your dashboard! First, create a value box for the 
##'maximum velocity of a fireball at peak brightness (the variable vel in your 
##'nasa_fireball data frame). There are many ways to find the maximum value in 
##'R; be sure to remove NA values when doing so.
##'
##'The nasa_fireball data frame has already been loaded.

library("shiny")
max_vel <- max(nasa_fireball$vel, na.rm = TRUE)

body <- dashboardBody(
    fluidRow(
        # Add a value box for maximum velocity
        valueBox(
            value = max_vel,
            subtitle = "Maximum pre-impact velocity",
            icon = icon("fire")
        )
    )
)
ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
