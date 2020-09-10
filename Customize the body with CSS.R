##'Customize the body with CSS
##'
##'You can customize the CSS by using the tags() function, for example you can 
##'add css to headers in the body in the following manner.

# body <- dashboardBody(
#     tags$head(
#         tags$style(
#             HTML('
#             \\Add CSS here
#             ')
#         )
#     )
# )

##'Add the following CSS to make the box title bold by updating the font in the 
##'h3 header in the body:
    
    # h3 {
    #     font-weight: bold;
    # }

library("shiny")

body <- dashboardBody(
    # Update the CSS
    tags$head(
        tags$style(
            HTML('
            h3 {
    font-weight: bold;
}
            ')
        )
    )
    ,
    fluidRow(
        box(
            width = 12,
            title = "Regular Box, Row 1",
            "Star Wars, nothing but Star Wars"
        )
    ),
    fluidRow(
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Row 2, Column 1",
                   subtitle = "Gimme those Star Wars"
               )
        ),
        column(width = 6,
               infoBox(
                   width = NULL,
                   title = "Regular Box, Row 2, Column 2",
                   subtitle = "Don't let them end"
               )
        )
    ))


ui <- dashboardPage(
    skin = "purple",
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    body = body)
shinyApp(ui, server)
