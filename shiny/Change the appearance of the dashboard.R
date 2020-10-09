##'Change the appearance of the dashboard
##'
##'Walt Disney's favorite color is purple (mine too!). Using the application 
##'you've just created, let's change the color by updating the skin parameter 
##'to "purple". The body you just created is already loaded.

# Update the skin
ui <- dashboardPage(
    skin = "purple",
    header = dashboardHeader(),
    sidebar = dashboardSidebar(),
    body = body)

# Run the app
shinyApp(ui, server)
