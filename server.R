# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(mtcars, input$brush1,
                                  xvar = "disp", yvar = "mpg")
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    lm(mpg ~ disp, data = brushed_data)
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
  output$plot1 <- renderPlot({
    plot(mtcars$disp, mtcars$mpg, xlab = "Displacement", xlim = c(100,500),
         ylab = "MPG", ylim = c(5,40), main = "Miles per gallon based on engine displacement",
         cex = 2.0, pch = 10, bty = "n")
    if(!is.null(model())){
      abline(model(), col = "blue", lwd = 2)
    }
  })
})