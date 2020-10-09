# View real-time data

# Now that you've read in the real-time data as reactive_starwars_data(), you 
# can examine it as it updates using renderTable(). If you save this reactive 
# table, you can then render it using the tableOutput() function. For example, 
# if we had a reactive data frame called my_reactive_data() we could save this 
# as output$my_table and render it using tableOutput() with the following code:
# 
# server <- function(input, output, session) {
#   output$my_table <- renderTable({
#     my_reactive_data()
#   })
# }
# 
# body <- dashboardBody(
#   tableOutput("my_table")
# )

library(shiny)

server <- function(input, output, session) {
    reactive_starwars_data <- reactiveFileReader(
        intervalMillis = 1000,
        session = session,
        filePath = starwars_url,
        readFunc = function(filePath) { 
            read.csv(url(filePath))
        }
    )
    
    output$table <- renderTable({reactive_starwars_data()})
}

body <- dashboardBody(
    tableOutput("table")
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
