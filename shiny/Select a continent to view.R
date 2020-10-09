ui <- fluidPage(
    h1("Gapminder"),
    sliderInput(inputId = "life", label = "Life expectancy",
                min = 0, max = 120,
                value = c(30, 50)),
    # Add a continent selector dropdown
    selectInput("continent", "Continent", choices = levels(gapminder$continent)),
    tableOutput("table")
)

server <- function(input, output) {
    output$table <- renderTable({
        data <- gapminder
        data <- subset(
            data,
            lifeExp >= input$life[1] & lifeExp <= input$life[2]
        )
        data <- subset(
            data,
            # Filter the data according to the continent input value
            continent == input$continent
        )
        data
    })
}

shinyApp(ui, server)
