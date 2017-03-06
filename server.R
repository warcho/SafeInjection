
library(shiny)
source('scripts/basic-statistics.r')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  output$frame <- renderUI({
    input$Member
    my_test <- tags$iframe(src='https://www.google.com/maps/d/u/0/embed?mid=142v0w1u6XGVXu_i9B38133Ou1GQ',height=600, width=535)
    print(my_test)
    my_test
  })
  
  
  output$trendPlot <- renderPlotly({
    stateVis()
  })
  
  output$basicOdds <- renderPlotly({
    variable <- c('age < 30 yr', 'public drug use', 'homelessness', 'daily heroin injection',
                  'daily cocaine injection', 'recent overdose')
    odds.ratio <- c(1.6, 2.6, 1.7, 2.1, 1.6, 2.7)
    oddsratios <- data.frame(variable, odds.ratio)
    
    compareodds <- plot_ly(y = oddsratios$variable, x = oddsratios$odds.ratio,
                           type = 'bar', orientation = 'h') %>% 
                    layout(title = 'Odds Ratios of IDU Behaviors',
                           xaxis = list(title = 'Odds Ratio'),
                           yaxis = list(title = 'Behavior'))
  })
  
})


