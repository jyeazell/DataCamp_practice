##'Allow the user to input an alert threshold
##'
##'Perhaps the people using your application would rather have a different 
##'threshold for changing the color of your value box. Create a slider in the 
##'sidebar to allow the user to input the threshold for the value box color.


sidebar <- dashboardSidebar(
    sliderInput(inputId = "threshold", 
                label = "Color Threshold", 
                min = 0, 
                max = 100, 
                value = 10)
)

server <- function(input, output) {
    output$us_box <- renderValueBox({
        valueBox(
            value = n_us,
            subtitle = "Number of Fireballs in the US",
            icon = icon("globe"),
            color = if (n_us < input$threshold) {
                "blue"
            } else {
                "fuchsia"
            }
        )
    })
}


ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = sidebar,
                    body = body
)
shinyApp(ui, server)
