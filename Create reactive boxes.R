# Create reactive boxes

# In addition to updating the task drop down menus reactively, it is possible 
# to create reactive boxes in the body. Here, you have a clickable action 
# button in your sidebar. You want to update a value box each time the user 
# clicks the action button. The valueBox() function will create a value box 
# in the body. This takes the following form:
    
    # valueBox(value = 10,
    #          subtitle = "There are ten things here!"
    # )

library("shiny")
sidebar <- dashboardSidebar(
    actionButton("click", "Update click box")
) 

server <- function(input, output) {
    output$click_box <- renderValueBox({
        valueBox(value = input$click, subtitle = "Click Box"
        )
    })
}

body <- dashboardBody(
    valueBoxOutput("click_box")
)


ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = sidebar,
                    body = body
)
shinyApp(ui, server)
