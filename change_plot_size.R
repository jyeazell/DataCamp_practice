##' Making your plot larger 
##' 
##' Just as input functions can have different arguments depending on the type
##' of input, so can output placeholder functions have different arguments to
##' modify their appearance or behaviour.
##' 
##' For example, when displaying a plot in a Shiny app using plotOutput(), the
##' height of the plot by default will be 400 pixels. The plotOutput() function
##' has some parameters that can be used to modify the height or width of a
##' plot.

ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            textInput("title", "Title", "GDP vs life exp"),
            numericInput("size", "Point size", 1, 1),
            checkboxInput("fit", "Add line of best fit", FALSE),
            colourInput("color", "Point color", value = "blue"),
            selectInput("continents", "Continents",
                        choices = levels(gapminder$continent),
                        multiple = TRUE,
                        selected = "Europe"),
            sliderInput("years", "Years",
                        min(gapminder$year), max(gapminder$year),
                        value = c(1977, 2002))
        ),
        mainPanel(
            # Make the plot 600 pixels wide and 600 pixels tall
            plotOutput("plot", width = 600, height = 600)
        )
    )
)

# Define the server logic
server <- function(input, output) {
    output$plot <- renderPlot({
        data <- subset(gapminder,
                       continent %in% input$continents &
                           year >= input$years[1] & year <= input$years[2])
        
        p <- ggplot(data, aes(gdpPercap, lifeExp)) +
            geom_point(size = input$size, col = input$color) +
            scale_x_log10() +
            ggtitle(input$title)
        
        if (input$fit) {
            p <- p + geom_smooth(method = "lm")
        }
        p
    })
}

shinyApp(ui = ui, server = server)
