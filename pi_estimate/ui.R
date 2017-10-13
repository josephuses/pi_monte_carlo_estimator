#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  withMathJax(),
  
  # Application title
  titlePanel("Estimating the value of \\(\\pi\\) using Monte Carlo Method"),
  
  withMathJax(),
  
  helpText('We have learned from geometry that the area of a circle is \\(\\pi r^2\\) , where \\(r\\) is the radius of the circle. But how did early mathematicians estimate the value of \\(\\pi\\)? More importantly, how can you estimate the value of \\(\\pi\\)? Well, to start with, if we know the area of the circle and the radius of the circle, we can solve for \\(\\pi\\)! Well, we know that in a circle in a square scenario, we have area of circle = (area of circle / area of square) * area of square. So if we can estimate (area of circle / area of square), we can easily estimate the area of the cirlce, and finally \\(\\pi\\). Using Monte Carlo Simulation, we can randomly generate \\(n\\) points falling inside a square. The ratio of the points inside the circle to the total number \\(n\\) points is an approximation of (area of circle / area of square). Then an estimate of the area of the circle is simply \\(4 \\times \\text{(points inside circle)} / n\\). (You do the math.)'),
  
  helpText('What do you notice when we increase the number of points?'),
  
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       numericInput("npoints",
                   "Number of points:",
                   min = 1,
                   max = 10e7,
                   value = 10),
       numericInput("radius",
                    "Radius:",
                    min = 0.1,
                    max = 3,
                    step = 0.1,
                    value = 1)
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      p('The source code for this app is available at', a("this link.", href="https://github.com/josephuses/pi_monte_carlo_estimator"), "and took ideas from", a("this post", href="https://www.r-bloggers.com/estimation-of-the-number-pi-a-monte-carlo-simulation/"), "and", a("this post.", href="https://stackoverflow.com/questions/15186163/monte-carlo-pi-method"))
    )
  )
))
