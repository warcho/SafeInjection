
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
        mainPanel(
          h2('Impact of Safe Injection Facilities on King County'),
          p('The two recently approved safe injection sites for King County will be very 
            similar to the one established just north of Seattle in Vancouver, British 
            Columbia in 2003. Following suit after many European cities, Canadian Cities 
            have been implementing safe injection facilities for injection drug users in 
            efforts to reduce community and public health impacts.'),
          p('Since its opening, the Vancouver SIF has seen 3.5 million visits. According 
            to Vancouver Coastal Health, in 2015, there were 263,713 visits by 6,532 
            individials (avg. 722 visits/day), 768 overdoses, 5,368 referrals to social 
            and health services with 262 completing drug treatment. They also claim to 
            have reversed nearly 5,000 overdoses, with no deaths, all while preventing 
            the spread of diseases such as HIV and hepatitis C and reducing dangerous 
            litter on local streets. Seeking funding and location commitment, Seattle 
            and King County will be the first to have facilities of its type on American 
            soil albeit on a smaller scale.'),
          p("In 2015, King County saw 209 heroin or prescription opioid overdose related 
            deaths. British Columbia, which has a population that is roughly double that 
            of King County, saw 914 deaths. Over 600 used needles were found in Seattle's 
            urban core in November of 2016 alone. The primary purpose of SIFs are to 
            create a more controlled environment to reduce public drug use, create 
            relationships between the highly marginalized 'at-risk' population and health 
            care, and encourage the seeking out of medical care and addiction treatment. 
            This can be accomplished by providing clean injection equipment and medical 
            attention in the case of overdose (contaminated needles and OD being major 
            risk factors) as well as access/refferal to healthcare services."),
          br(),
          plotlyOutput('basicOdds'),
          p("The graphic above displays the odds ratios of various risk factors of IDUs 
            given that they attended the Vancouver SIF relative to other IDUs. Analyses 
            of those users showed that the facility attracted a particularly high-risk 
            population. The highest of those odds ratios were for experiencing a recent 
            overdose. The odds of someone having recently experienced an overdose given 
            that they attend the SIF are 2.7x higher than an IDU that does not attend 
            the SIF. The higher odds are ultimately good for two reasons. The first 
            being that it's preferable to have an IDU overdose in the presense of 
            medical staff and the resources to attend to/reverse the overdose. The other 
            being that it increases the likelihood of the higher-risk population to use 
            in the facilities rather than in the streets with variables that may be out 
            of their control. Our team believes a similar effect could be observed in 
            the city of Seattle and the rest of King County.")
        )
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
