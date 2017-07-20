#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(lubridate)

# source helpers functions
source("helpers.R")

# Get a random (daily) timeseries of size n, beginning at dateref 
# my_timeseries <- getTimeseries(n = 10, dateorigin = '2016-12-01')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    my_timeseries <- getTimeseries(n = 10, dateorigin = '2016-12-01')
    str(my_timeseries)
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
