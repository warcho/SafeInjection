library(shiny)
source('scripts/basic-statistics.R')
source('scripts/map.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$frame <- renderUI({
    input$Member
    my_test <- tags$iframe(src='https://www.google.com/maps/d/u/0/embed?mid=142v0w1u6XGVXu_i9B38133Ou1GQ',height=600, width='100%')
    print(my_test)
    my_test
  })
  
  output$frame2 <- renderUI({
    input$Member
    my_test <- tags$iframe(src='https://www.google.com/maps/d/u/0/embed?mid=1orhr3nhoStbT71RH-6WZAGCx1fM',height=600, width='100%')
    print(my_test)
    my_test
  })
  
  output$trendPlot <- renderPlotly({
    #From basic-statistics file
    stateVis()
  })
  
  output$basicOdds <- renderPlotly({
    
    #Use data from Insite study to create a visualization
    variable <- c('Age < 30 yr', 'Public Drug Use', 'Homelessness', 'Daily Heroin Injection',
                  'Daily Cocaine Injection', 'Recent Overdose')
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
  
  output$downtownMap <- renderPlot({
    #From map file
    downtownMap()
  })
  
  output$northSeattleMap <- renderPlot({
    #From map file
    northSeattleMap()
  })
  
  output$timeChart <- renderPlotly({
    #From spd-wrangle file
    timeChart()
  })
  
  output$monthChart <- renderPlotly({
    #From spd-wrangle file
    monthChart()
  })
  
})


