
library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme('sandstone'),
  
  navbarPage('King County Safe Injection Sites',
    tabPanel('Drug Overdose Trends',
        mainPanel(
          h2("Drug Overdose Trends In King County"),
          p("Heroin and prescription opioid use has been exploding
            across the United States. Changes in prescription drug
            policies and a lack of addiction support services have
            moved large numbers of disadvantaged people to heroin,
            one of the most addictive drugs in the world. Heroin use
            comes with a multitude of impacts on community health, including
            deaths due to overdose, spreading blood-born diseases, homelessness,
            and unsafe garbage related to drug use. King County has been approved
            to implement two safe injection sites, spaces that offer a safe place
            for injection drug users too shoot up, while providing addiction treatment
            and other health services."),
          plotlyOutput('trendPlot'),
          htmlOutput("frame")
        )
    ),
    tabPanel('Potential Impact',
      sidebarLayout(
        sidebarPanel('Impact of Safe Injection Site on Seattle Area', width = 3
        ),
        mainPanel(
        ))
    ),
    tabPanel('Implementation Guide',
      sidebarLayout(
       sidebarPanel('Guide for Proper Implementation', width = 3
       ),
       mainPanel(
       ))
    )
  )
))
