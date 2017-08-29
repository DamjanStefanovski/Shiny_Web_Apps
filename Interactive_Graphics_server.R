#
# 
#Interactive Graphics: server.R Part 1

library(shiny)
shinyServer(function(input, output) {
        model <- reactive({
                brushed_data <- brushedPoints(trees, input$brush1,
                                              xvar = "Girth", yvar = "Volume")
                if(nrow(brushed_data) < 2){
                        return(NULL)
                }
                lm(Volume ~ Girth, data = brushed_data)
        })
        output$slopeOut <- renderText({
                if(is.null(model())){
                        "No Model Found"
                } else {
                        model()[[1]][2]
                }
        })
      
        output$intOut <- renderText({
                if(is.null(model())){
                        "No Model Found"
                } else {
                        model()[[1]][1]
                }
        })
        
        # Plot ,, renderplot part 2 of the app 
        output$plot1 <- renderPlot({
                plot(trees$Girth, trees$Volume, xlab = "Girth",
                     ylab = "Volume", main = "Tree Measurements",
                     cex = 1.5, pch = 16, bty = "n")
                if(!is.null(model())){
                        abline(model(), col = "blue", lwd = 2)
                }
        })
})

#Sharing Shiny Apps

#Once you've created a Shiny app, there are several ways to share your app. 
#Using shinyapps.io allows users to interact with your app through a web browser 
#without needing to have R or Shiny installed. Shinyapps.io has a free tier, 
#but if you want to use a Shiny app in your business you may be interested in paying
#for the service. If you're sharing your app with an R user you can post your app to 
#GitHub and instruct the user to use the runGist() or runGitHub() function to launch your app.




