#This a Shiny project.  It will display the Populations Map Of The City In USA


library(shiny)
library(maps)
# Getting data from the us.cities 
data(us.cities)


# The UI of the application. On the left of the page will be dropdown list of the cities in USA
shinyUI(
  navbarPage("Populations Map Of The City In USA",
             tabPanel("Map",
  
  sidebarPanel(    
    selectInput('city', 'Cities of USA', choices=us.cities$name)
    ), 
# On the right of the page, the population of selected city will be displayed
  mainPanel( 
    plotOutput('map')
    
  )),
tabPanel("About",
         
           includeHTML('intro.html')
         
         )
))

