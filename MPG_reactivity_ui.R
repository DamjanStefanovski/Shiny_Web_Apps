#
#This application predicts the horsepower of a car given the fuel efficiency in miles per gallon for the car.

#Horsepower Prediction: ui.R Part 1

library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Horsepower from MPG"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20),
                        checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
                        checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
                        submitButton("Submit") # New!
                ),
                # ...
               # Horsepower Prediction: ui.R Part 2
                
                # ...
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Horsepower from Model 1:"),
                        textOutput("pred1"),
                        h3("Predicted Horsepower from Model 2:"),
                        textOutput("pred2")
                )
        )
))























