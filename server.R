
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
    one <- c(1, 1, 1, 1, 1, 1)
    odds.ratio <- c(0.6, 1.6, 0.7, 1.1, 0.6, 1.7)
    oddsratios <- data.frame(variable, one, odds.ratio)
    
    compareodds <- plot_ly(x = oddsratios$variable, y = oddsratios$one,
                           name = 'average', type = 'bar') %>% 
      add_trace(y = oddsratios$odds.ratio, name = 'IDU @ SIF') %>% 
      layout(title = 'Odds Ratios of IDU Behaviors',
             xaxis = list(title = 'Behavior'),
             yaxis = list(title = 'Odds Ratio'),
             barmode = 'stack')
  })
  
})


