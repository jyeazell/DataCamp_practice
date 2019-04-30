#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(readr)
library(dplyr)
library(ggplot2)

# Load data file from S3 bucket.

reporting <- read_csv("https://s3-us-west-2.amazonaws.com/dwr-enf-shiny/reporting_compliance_2018.csv")
reporting$wr_type <- as.factor(reporting$wr_type)
all_types <- sort(unique(reporting$wr_type))

# UI

ui <- fluidPage(
   
   # Application title
   titlePanel("Reporting Compliance Rates"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
       
       # Input(s)
       sidebarPanel(
         selectInput(inputId = "selected_wr_type",
                     label = "Select Water Right Types to plot:",
                     choices = all_types,
                     selected = "Appropriative",
                     multiple = TRUE,
                     selectize = TRUE)
      ),
      
      # Output(s)
      mainPanel(
         plotOutput(outputId = "rateplot")
      )
   )
)

# Server

server <- function(input, output) {
    
    # Filter data for selected wr_types.
    plot_subset <- reactive({
        req(input$selected_wr_type)
        filter(reporting, wr_type %in% input$selected_wr_type)
    })
    
    # rateplot
    output$rateplot <- renderPlot({
        ggplot(data = plot_subset, aes_string(x = "file_date", 
                                            y = "rept_pct", 
                                            color = "wr_type")) +
            geom_line()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

