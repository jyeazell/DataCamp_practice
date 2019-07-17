##' Add colours to your plot: color input
##' 
##' The colourpicker package provides a color input, available through the 
##' colourInput() function. Even though color inputs are not part of the shiny
##' package, they behave in the same way as any other input. 
##' 
##' A color input can have many different arguments you can explore, but we will
##' only use the basic arguments: inputId, label, and value. The value argument
##' accepts a color to use as the initial value. Colours can be specified in
##' several different formats, but the easiest one is to simply use English
##' color names such as "red" or "yellow".

# Load the colourpicker package
library(colourpicker)

ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            textInput("title", "Title", "GDP vs life exp"),
            numericInput("size", "Point size", 1, 1),
            checkboxInput("fit", "Add line of best fit", FALSE),
            
            # Replace the radio buttons with a color input
            colourInput("color", "Point color", "blue"),
            selectInput("continents", "Continents",
                        choices = levels(gapminder$continent),
                        multiple = TRUE,
                        selected = "Europe"),
            sliderInput("years", "Years",
                        min(gapminder$year), max(gapminder$year),
                        value = c(1977, 2002))
        ),
        mainPanel(
            plotOutput("plot")
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
