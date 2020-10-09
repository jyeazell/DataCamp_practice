##'Create a value box for the maximum impact
##'
##'Let's add another value box for the maximum log total impact energy. The 
##'variable in the nasa_fireball data frame corresponding to this is impact_e. 
##'The nasa_fireball data frame is again already loaded.

library("shiny")

max_impact_e <- max(nasa_fireball$impact_e, na.RM = TRUE)

body <- dashboardBody(
    fluidRow(
        # Add a value box for maximum impact
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
    )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
