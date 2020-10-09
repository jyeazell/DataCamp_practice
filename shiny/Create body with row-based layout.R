##'Create body with row-based layout
##'
##'Recall that you can create a dashboard with row-based layout using the 
##'fluidRow() function from shiny within the dashboardBody(). We want to create 
##'two rows, one with the following content:
#     
#     # Row 1
#     box(
#         width = 12,
#         title = "Regular Box, Row 1",
#         "Star Wars"
#     )
# and a second row with the following content:
#     
#     # Row 2
#     box(
#         width = 12,
#         title = "Regular Box, Row 2",
#         "Nothing but Star Wars"
#     )

library("shiny")

body <- dashboardBody(
    fluidRow(
        # Row 1
        box(
            width = 12,
            title = "Regular Box, Row 1",
            "Star Wars"
        )
    ),
    fluidRow(
        # Row 2
        box(
            width = 12,
            title = "Regular Box, Row 2",
            "Nothing but Star Wars"
        )
    )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
)
shinyApp(ui, server)
