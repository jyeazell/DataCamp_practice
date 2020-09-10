##'Incorporate icons
##'
##'Icons are a great way to make your dashboard look more polished! Remember 
##'the notification menu we created in Chapter 1? Spruce it up with a rocket 
##'icon! You can find other possible icons on the Font Awesome website. Recall 
##'that icons can be rendered using the icon() function in shiny; for example, 
##'the following will render a coffee icon:
    
#    icon("coffee")

##'The Font Awesome name for the rocket icon is "rocket".

library("shiny") 

header <- dashboardHeader(
    dropdownMenu(
        type = "notifications",
        notificationItem(
            text = "The International Space Station is overhead!",
            icon = icon("rocket")
        )
    )
)
ui <- dashboardPage(header = header,
                    sidebar = dashboardSidebar(),
                    body = dashboardBody()
)
shinyApp(ui, server)    
