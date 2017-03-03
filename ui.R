
library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme('sandstone'),
  
  navbarPage('King County Safe Injection Sites',
    tabPanel('Drug Overdose Trends',
      sidebarLayout(
        sidebarPanel('Drug Overdose Trends', width = 2
        ),
        mainPanel(
        ))
    ),
    tabPanel('Potential Impact',
      sidebarLayout(
        sidebarPanel('Impact of Safe Injection Site on Seattle Area', width = 2
        ),
        mainPanel(
        ))
    ),
    tabPanel('Implementation Guide',
      sidebarLayout(
       sidebarPanel('Guide for Proper Implementation', width = 2
       ),
       mainPanel(
       ))
    )
  )
))
