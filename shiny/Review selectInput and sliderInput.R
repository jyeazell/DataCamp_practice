# As a quick refresher, using the dashboardSidebar() function along with 
# selectInput() and sliderInput() from the shiny package, you can create select 
# lists and sliders. For example, to create a select list in the sidebar, you 
# can do the following:
#     
#     sidebar <- dashboardSidebar(
#         selectInput(inputId = "numbers",
#                     label = "Numbers",
#                     choices = 1:3)
#     )
#     
# For this chapter, we are working with the dplyr starwars dataset, a data set 
# pulled from the Star Wars API containing information about characters from
# Star Wars. We are interested in creating a subset of the data set of 
# characters  between specified height parameters. For this exercise, create a 
# slider to indicate the maximum height you'd like in your subset.

library(shiny)
library(shinydashboard)
library(dplyr)

sidebar <- dashboardSidebar(
    # Add a slider
    sliderInput(inputId = "height",
                label = "Height",
                min = 66,
                max = 264,
                value = 264)
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = sidebar,
                    body = dashboardBody()
)

server <- function(input, output) {
}


shinyApp(ui, server) 
