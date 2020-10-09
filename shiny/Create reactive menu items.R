# Create reactive menu items

# We have added dynamic content via subsetting a data frame based on using 
# input and reading in real-time data. Now we are going to allow the user to 
# input task_data to determine task items. Recall that we can use an apply() 
# function to iterate over a data frame, applying the taskItem() function to 
# each row.
# 
# tasks <- apply(task_data, 1, function(row) { 
#     taskItem(text = row[["text"]],
#              value = row[["value"]])
# })
# dropdownMenu(type = "tasks", .list = tasks)
# 
# You have a data frame (already loaded) called task_data with columns text and 
# value. Use this to create a task drop down menu.

library(shiny)
library(shinydashboard)

task_data <- data.frame(text = c("ONE", "TWO", "THREE"),
                        value = c(10, 50, 70),
                        stringsAsFactors = FALSE)


server <- function(input, output) {
    output$task_menu <- renderMenu({
        tasks <- apply(task_data, 1, function(row) { 
            taskItem(text = row[["text"]],
                     value = row[["value"]])
        })
        dropdownMenu(type = "tasks", .list = tasks)
    })
}

header <- dashboardHeader(dropdownMenuOutput("task_menu"))

ui <- dashboardPage(header = header,
                    sidebar = dashboardSidebar(),
                    body = dashboardBody()
)
shinyApp(ui, server)
