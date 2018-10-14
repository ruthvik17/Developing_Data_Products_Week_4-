# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("Display fitted model from selected data points"),
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput("slopeOut"),
      h3("Intercept"),
      textOutput("intOut")
    ),
    mainPanel(
      h5("Use the mouse to select a group of points to model:"),
      h5("Hold the left mouse button down and drag over the points to model"),
      h5("Release the button to view the fitted line"),
      h5("The slope and intercept of the fitted line will be displyed in the side panel"),
      plotOutput("plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
))