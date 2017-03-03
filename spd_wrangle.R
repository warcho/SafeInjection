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
###

#create a new data frame with total overdoses by month
by.month <- data %>% group_by(month) %>% summarise(Overdose.Deaths = n()) %>% arrange(month) %>% na.omit(by.month)

#add a column with numbers to make sorting by month easier
by.month$nums <- c(4, 8, 12, 2, 1, 7, 6, 3, 5, 11, 10, 9)
by.month$month <- factor(by.month$month, levels = by.month[["month"]])


#create a bar chart for overdoses by month
month_chart <- plot_ly(by.month, x = ~month, y = ~Overdose.Deaths, type = 'bar', text = text,
                       marker = list(color = 'rgb(158,202,225)',
                                     line = list(color = 'rgb(8,48,107)',
                                                 width = 1.5))) %>%
              layout(title = "Seattle Overdose Deaths by Month",
                xaxis = list(title = "Month"),
                yaxis = list(title = "Overdose Deaths"))

#add a column with year
data$year <- as.numeric(format(data$Date,'%Y'))

#create data frame with total deaths by year
by.year <- data %>% group_by(year) %>% summarise(Overdose.Deaths = n()) %>% arrange(year) %>% na.omit(by.year)

#chart for deaths by year
year_chart <- plot_ly(by.month, x = ~year, y = ~Overdose.Deaths, type = 'bar', text = text,
                       marker = list(color = 'rgb(158,202,225)',
                                     line = list(color = 'rgb(8,48,107)',
                                                 width = 1.5))) %>%
  
  layout(title = "Seattle Overdose Deaths by Year",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Overdose Deaths"))

month_year <- data %>% group_by(month, year) %>% summarise(Overdose.Deaths = n()) %>% arrange(year) %>% na.omit(month_year)
month_year <- month_year %>% arrange(year)

#########################################################################################
#make time 24 hours
AM <- filter(data, grepl('AM', Time)) %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
PM <- filter(data, grepl('PM', Time)) %>% group_by(Time) %>% summarise(Overdose.Deaths = n())

AM$Time <- as.numeric(format(strptime(AM$Time,"%H:%M:%S"),'%I'))
PM$Time <- as.numeric(format(strptime(PM$Time,"%H:%M:%S"),'%I'))

AM <- AM %>% group_by(Time) %>% summarise(Overdose.Deaths = n())
PM <- PM %>% group_by(Time) %>% summarise(Overdose.Deaths = n())

updated <- data.frame(read.csv("data/spd-updated-data.csv"))
