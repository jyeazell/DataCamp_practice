# Using the dplyr starwars dataset, create a shiny app that allows the user 
# to select a character by name and output the selected name in the body. 
# The data frame is already loaded as starwars.

library(shiny)
sidebar <- dashboardSidebar(
    # Create a select list
    selectInput(inputId = "name",
                label = "Name",
                choices = starwars$name)
)

body <- dashboardBody(
    textOutput(outputId = "name")
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = sidebar,
                    body = body
)

server <- function(input, output) {
    output$name <- renderText({
        input$name
    })
}

shinyApp(ui, server)
