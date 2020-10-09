##'Create body with mixed layout
##'
##'In addition to having layouts specified using rows and columns, we can have 
##'mixed layouts that combine the two.
##'
##'Let's create two rows where the first row includes the following content:

# # Row 1
#   box(
#     width = 12,
#     title = "Regular Box, Row 1",
#     "Star Wars, nothing but Star Wars"
#     )

##'and a second row has two columns, where each column has the following content:

# # Row 2, Column 1
#   infoBox(
#     width = NULL,
#     title = "Regular Box, Row 2, Column 1",
#     subtitle = "Gimme those Star Wars"
#     )
# # Row 2, Column 2
#   infoBox(
#     width = NULL,
#     title = "Regular Box, Row 2, Column 2",
#     subtitle = "Don't let them end"
#     )

library("shiny")

body <- dashboardBody(
    fluidRow(
        # Row 1
        box(
            width = 12,
            title = "Regular Box, Row 1",
            "Star Wars, nothing but Star Wars"
        )
    ),
    fluidRow(
        # Row 2, Column 1
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Row 2, Column 1",
                   subtitle = "Gimme those Star Wars"
               )
        ),
        # Row 2, Column 2
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Row 2, Column 2",
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
