#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  output$ex1 <- renderUI({
    withMathJax(helpText('Dynamic output 1:  $$\\alpha^2$$'))
  })
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    n <- input$npoints
    R <- input$radius
    
    x <- runif(n, min= -R, max= R)
    y <- runif(n, min= -R, max= R)
    
    is_inside <- (x^2 + y^2) <= R^2
    pi.estimate <-  4 * sum(is_inside) / n
    
    n_inside <- sum(is_inside)
    n_outside <- sum(!is_inside)
    
    
    x_inside <- x[is_inside]
    y_inside <- y[is_inside]
    
    x_outside <- x[!is_inside]
    y_outside <- y[!is_inside]
    
    df <- data.frame(rbind(cbind(x_inside, y_inside), cbind(x_outside, y_outside)))
    colnames(df) <- c("x", "y")
    df$loc <- c(rep(c("inside", "outside"), times = c(n_inside, n_outside)))
    

    df %>%
      ggplot(aes(x,y, color = loc)) + 
      geom_point() + 
      ggtitle(paste("An estimate of pi is", pi.estimate)) +
      theme_bw() +
      theme(legend.position = "none")

  }, height = 400, width = 400)
  
})
