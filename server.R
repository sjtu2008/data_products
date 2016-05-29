#This a Shiny project.  It will display the Populations Map Of The City In USA

library(shiny)
library(UsingR) 
# Load the library of maps
library(maps)
# Load  ggplot2 library to plot the map of USA and populaiton no. of the city
library(ggplot2)

# Load the data of us.cities in the maps library
data("us.cities")

shinyServer(  
  function(input, output,session) { 
    observe({
# Get the selected city from the dropdown list of ui.R
      
    SeletedCity <- reactive({input$city})
# Subset the data from us.cities where the city == selected city
    city <- subset(us.cities, name == SeletedCity())

# Plot the map with the population no. of the selected city   
    output$map <-renderPlot({
      
      ggplot(city,aes(long,lat))+
        borders("state", colour = "grey70")+
        geom_point(color ="red",alpha = 0.5)+
        geom_text(aes(label =pop),data = city,size = 3,color = "blue",nudge_y = 0.8 )+
        geom_text(aes(label =name),data = city,size = 3,color = "red",nudge_y = -0.8 )
    }) 
         }) }
)