#Interactive Graphics

#One of my favorite features of Shiny is the ability to create graphics that a user can 
#interact with. One method you can use to select multiple data points on a graph is by
#specifying the brush argument in plotOutput() on the ui.R side, and then using the 
#brushedPoints() function on the server.R side. 
#The following example app fits a linear model for the selected points and then draws 
#a line of best fit for the resulting model.

library(webshot)

#Interactive Graphics: ui.R

library(shiny)
shinyUI(fluidPage(
        titlePanel("Visualize Many Models"),
        sidebarLayout(
                sidebarPanel(
                        h3("Slope"),
                        textOutput("slopeOut"),
                        h3("Intercept"),
                        textOutput("intOut")
                ),
                mainPanel(
                        plotOutput("plot1", brush = brushOpts(
                                id = "brush1"
                        ))
                )
        )
))


