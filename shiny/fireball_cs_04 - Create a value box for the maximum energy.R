##'Create a value box for the maximum energy
##'
##'Let's create a third value box for the maximum total optical radiated energy.
##'The variable for this in the nasa_fireball data frame is energy. Again, the 
##'nasa_fireball data frame is loaded.

library("shiny")

max_energy <- max(nasa_fireball$energy, na.rm = TRUE)

body <- dashboardBody(
    fluidRow(
        # Add a value box for maximum energy
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
    )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
