##'Create body with column-based layout
##'
##'Recall that you can create your contents in columns using a combination of 
##'the fluidRow() and column() functions from the shiny package. For example, 
##'for two columns of content in the body, you can do the following:
# 
# body <- dashboardBody(
#     fluidRow(
#         column(width = 6,
#                "This is one column"
#         ),
#         column(width = 6,
#                "This is a second column"
#         )
#     )
# )
##'Let's create two columns where the first column includes the following content:

# # Column 1
#   infoBox(
#     width = NULL,
#     title = "Regular Box, Column 1",
#     subtitle = "Gimme those Star Wars"
#     )
  
##'and a second column with the following content:

# # Column 2
#   infoBox(
#     width = NULL,
#     title = "Regular Box, Column 2",
#     subtitle = "Don't let them end"
#     )

##'Recall that with column layouts, you want to set the width = NULL within the 
##'boxes (this is true for box(), infoBox(), and valueBox()), and control the 
##'width with the column() function.

library("shiny")

body <- dashboardBody(
    fluidRow(
        # Column 1
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Column 1",
                   subtitle = "Gimme those Star Wars"
               )
        ),
        # Column 2
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Column 2",
                   subtitle = "Don't let them end"
               )
        )
    )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
