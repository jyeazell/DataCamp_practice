##' Add a year filter: numeric slider input
##' 
##' Slider inputs can be used for similar purposes to numeric inputs, as they 
##' both provide the user with a way to select a number. 
##' 
##' If the initial provided value (the value argument) of the slider is a single
##' number, then the slider will be used to select single numbers. However, if
##' the initial value is a vector of two numbers, then the slider will be used
##' to select two numbers instead of just a single value.

library(gapminder)

ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            textInput("title", "Title", "GDP vs life exp"),
            numericInput("size", "Point size", 1, 1),
            checkboxInput("fit", "Add line of best fit", FALSE),
            radioButtons("color", "Point color",
                         choices = c("blue", "red", "green", "black")),
            selectInput("continents", "Continents",
                        choices = levels(gapminder$continent),
                        multiple = TRUE,
                        selected = "Europe"),
            # Add a slider selector for years to filter
            sliderInput("years", "Years", min(gapminder$year), max(gapminder$year), c(1977,2002))
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)

# Define the server logic
server <- function(input, output) {
    output$plot <- renderPlot({
        # Subset the gapminder data by the chosen years
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
