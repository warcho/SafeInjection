
library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme('united'),
  
  navbarPage('King County Safe Injection Sites',
    tabPanel('Eval 1',
      sidebarLayout(
        sidebarPanel('placehold', width = 2
        ),
        mainPanel(
        ))
    ),
    tabPanel('Eval 2',
      sidebarLayout(
        sidebarPanel('placehold', width = 2
        ),
        mainPanel(
        ))
    ),
    tabPanel('Eval 3',
      sidebarLayout(
       sidebarPanel('placehold', width = 2
       ),
       mainPanel(
       ))
    )
  )
))
