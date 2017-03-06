#This Script Creates a Heatmap of Seattle Drug Overdoes
#to be used in a project about the implementation of a Safe Injection Site in King County
# author : @kylegoodwin

#setwd('/Users/kylegoodwin/health/SafeInjection')
require(dplyr)
require(plotly)


data <- read.csv('data/spd-updated-data.csv',stringsAsFactors = FALSE)
state.data <- read.csv('data/state-overdose.csv',stringsAsFactors = FALSE)


#Function that returns the total number of overdose deaths for a given year
numberOfOverdosesYear <- function(y){
  year.data <- data %>% 
    filter(year == y)
  return(nrow(year.data))
}

#Function that returns the mode of a dataset
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#Return mosted common location for overdose
mostOverdosedLocation <- function(){
  d <- getmode(data$Hundred.Block.Location)
  return(d)
}

#Return a visualization of state drug use trends

stateVis <- function(){
  
  state.data <- rename(state.data, Deaths = Prescription.Deaths )
  
  plot <- plot_ly(state.data, x = ~Year, y = ~Deaths, name = 'Prescription Opiods', type = 'scatter', mode = 'lines') %>%
    add_trace(y = ~Heroin.Deaths, name = 'Heroin', mode = 'lines+markers')
  
  return(plot)
  
}



