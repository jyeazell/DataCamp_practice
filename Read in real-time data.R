# Read in real-time data
# 
# One benefit of a dashboard is the ability to examine real-time data. In shiny, 
# this can be done using the reactiveFileReader() or reactivePoll() functions from the shiny package. For example, if we had our data saved as a .csv, we could read it in using reactiveFileReader() along with the readFunc set to read.csv.
# 
# filepath <- "data.csv"
# 
# server <- function(input, output, session) {
#     reactive_data <- reactiveFileReader(
#         intervalMillis = 1000,
#         session = session, 
#         filePath = filepath,
#         readFunc = read.csv
#     )
# }
# We have our data saved as a .csv located at a url called starwars_url; this 
# object is already loaded for your convenience. In order to read this in, we can 
# set our own readFunc like this:
#     
#     readFunc = function(filePath) { 
#         read.csv(url(filePath))
#     }
# If this .csv were updated live, we would see the changes! Read in this 
# real-time data using reactiveFileReader().

library("shiny")

server <- function(input, output, session) {
    reactive_starwars_data <- reactiveFileReader(
        intervalMillis = 1000,
        session = session,
        filePath = starwars_url,
        readFunc = function(filePath) { 
            read.csv(url(filePath))
        }
    )
}

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = dashboardBody()
)
shinyApp(ui, server)
