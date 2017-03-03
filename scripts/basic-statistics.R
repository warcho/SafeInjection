#This Script Creates a Heatmap of Seattle Drug Overdoes
#to be used in a project about the implemetnation of a Safe Injection Site in King County
# author : @kylegoodwin

#setwd('/Users/kylegoodwin/health/SafeInjection')
require(dplyr)


data <- read.csv('data/spd-updated-data.csv',stringsAsFactors = FALSE)


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
