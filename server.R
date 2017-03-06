
library(shiny)
source('scripts/basic-statistics.r')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$frame <- renderUI({
    input$Member
    my_test <- tags$iframe(src='https://www.google.com/maps/d/u/0/embed?mid=142v0w1u6XGVXu_i9B38133Ou1GQ',height=600, width=535)
    print(my_test)
    my_test
  })
  
  
  output$trendPlot <- renderPlotly({
    stateVis()
  })
  
})


