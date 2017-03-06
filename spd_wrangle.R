require(dplyr)
require(knitr)
require(stringr)
require(tidyr)
require(plotly)
require(lubridate)

setwd("C:/Users/creil/Desktop/Winter 2017/Info498/Final/SafeInjection")
data <- data.frame(read.csv("data/spd-overdose-deaths.csv"), stringsAsFactors = FALSE)

###Used to make second dataset
#change the data and time to characters
data$Event.Clearance.Date <- lapply(data$Event.Clearance.Date, as.character)

#split date and time into two columns
data <- extract(data, Event.Clearance.Date, c("Date", "Time"), "([^ ]+) (.*)")

#add a column with month name
data$Date <- as.Date(data$Date, "%m/%d/%Y")
data$month <- months(as.Date(data$Date))

#add a column with year
data$year <- as.numeric(format(data$Date,'%Y'))

#########################################################################################
data_updated <- read.csv("data/spd-updated-data.csv")

timeChart <- function(){
  #make time 24 hours
  AM <- filter(data_updated, grepl('AM', Time)) %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
  PM <- filter(data_updated, grepl('PM', Time)) %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
  
  AM$Time <- as.numeric(format(strptime(AM$Time,"%H:%M:%S"),'%I'))
  PM$Time <- as.numeric(format(strptime(PM$Time,"%H:%M:%S"),'%I')) + 12
  
  AM <- AM %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
  PM <- PM %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
  
  AM_PM <- bind_rows(AM, PM)
  
  time_chart <- plot_ly(AM_PM, x = ~Time, y = ~Overdose.Deaths, type = 'bar', text = text,
                        marker = list(color = ~Overdose.Deaths,
                                      line = list(color = ~Overdose.Deaths,
                                                  width = 1.5))) %>%
    
    layout(title = "Seattle Overdose Deaths by Time of Day",
           xaxis = list(title = "Time of Day"),
           yaxis = list(title = "Overdose Deaths"))
  return(time_chart)
}
##########################################################
#by month for 2016
###
monthChart <- function(){

#create a new data frame with total overdoses by month
by.month <- data_updated %>% filter(year == 2016) %>% group_by(month) %>% summarise(Overdose.Deaths = n()) %>% arrange(month) %>% na.omit(by.month)

#add a column with numbers to make sorting by month easier
by.month$nums <- as.numeric(c(4, 8, 12, 2, 1, 7, 6, 3, 5, 11, 10, 9))
by.month <- arrange(by.month, nums)
by.month$month <- factor(by.month$month, levels = unique(by.month$month))

#create a bar chart for overdoses by month
month_chart <- plot_ly(by.month, x = ~month, y = ~Overdose.Deaths, type = 'bar', text = text,
                       marker = list(color = by.month$Overdose.Deaths,
                                                 width = 1.5)) %>%
  layout(title = "Seattle Overdose Deaths by Month (2016)",
         xaxis = list(title = "Month", 
                      type = "category",
                      categoryorder = "array",
                      categoryarray = sort(unique(by.month$nums))),
         yaxis = list(title = "Overdose Deaths"))
return(month_chart)
}

monthChart()

list <- c('D', 'M', 'K')
downtown <- filter(data_updated, District.Sector %in% weed)
downtown_ratio <- nrow(downtown)/nrow(data_updated)

###################################################
#data that has a "at scene time"
time_2016 <- data_updated 
time_2016$At.Scene.Time <- lapply(time_2016$At.Scene.Time, as.character)

library(stringr)
time_2016 <- str_split_fixed(time_2016$At.Scene.Time, " ", 2)
time_2016 <- data.frame(time_2016[!apply(time_2016 == "", 1, all),])

AM16 <- filter(time_2016, grepl('AM', X2)) %>% group_by(X2) %>% summarise(Overdose.Deaths = n())
PM16 <- filter(time_2016, grepl('PM', X2)) %>% group_by(X2) %>% summarise(Overdose.Deaths = n())

AM16$X2 <- as.numeric(format(strptime(AM16$X2,"%H:%M:%S"),'%I'))
PM16$X2 <- as.numeric(format(strptime(PM16$X2,"%H:%M:%S"),'%I')) + 12

AM16 <- AM16 %>% group_by(X2) %>% summarise(Overdose.Deaths = n())
PM16 <- PM16 %>% group_by(X2) %>% summarise(Overdose.Deaths = n())

AM_PM16 <- bind_rows(AM16, PM16)

time_chart2 <- plot_ly(AM_PM16, x = ~X2, y = ~Overdose.Deaths, type = 'bar', text = text,
                      marker = list(color = ~Overdose.Deaths,
                                    line = list(color = ~Overdose.Deaths,
                                                width = 1.5))) %>%
  
  layout(title = "Seattle Overdose Deaths by Time of Day",
         xaxis = list(title = "Time of Day"),
         yaxis = list(title = "Overdose Deaths"))
time_chart2
