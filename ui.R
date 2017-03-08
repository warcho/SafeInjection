library(shiny)
library(shinythemes)
library(plotly)
source('scripts/basic-statistics.R')
source('scripts/spd_wrangle.R')

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme('sandstone'),
                  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "app.css")
  ),
  
  navbarPage('King County Safe Injection Sites',
    tabPanel('Drug Overdose Trends',
        mainPanel(
          h1("Drug Overdose Trends In King County"),
          p("Heroin and prescription opioid use has been exploding
            across the United States. Changes in prescription drug
            policies and a lack of addiction support services have
            moved large numbers of disadvantaged people to heroin,
            one of the most addictive drugs in the world. Heroin use
            comes with a multitude of impacts on community health, including
            deaths due to overdose, spreading blood-born diseases, homelessness,
            and unsafe garbage related to injection. King County has approved
            the implementation two safe injection sites, spaces that offer a safe place
            for injection drug users too shoot up, while providing addiction treatment
            and other health services."),
          br(),
          h2("Basic Statistics"),
          h3(paste(numberOfOverdosesYear(2016),"Lives Lost Due to Overdose in 2016")),
          h3("Most Common Overdose Site: 1200 Block of Aurora Avenue North"),
          h3("6,998,794 Needles Were Exchanged in 2015"),
          h3("Overdose is the #1 Injury-Related Killer of 25-65 Year Olds"),
          p("Source: Seattle Police Report Database, King County Community Human Services: Heroin Trends 2015"),
          h2("Drug Overdose Trends Over 20 Years"),
          br(),
          tags$img(src = "trend.png", width = "75%"),
          p("Source: UW Alchohol & Drug Abuse Institute"),
          br(),
          p("This graph displays the rise of the Heroin overdose epidemic in King County. While the heroin epidemic of 
            the 1990's did recede in the early 2000's, the past 10 years have seen a resurgence in use as well as overdoses in the 
            King County area. The rates of overdose are now higher than they have ever been in the past."),
          h2("Analysis of Recent Trends"),
          p("From 2004 to 2014 King county saw a 80% increase in the number of publicly funded Opioid
            addiction treatments, and a 21% increase in deaths attributable to the drugs. As tougher
            federal laws about prescription drugs prevented people from abusing pills, more users
            turned to Heroin for an intense and cheap high. Heroin is much more dangerous due to its
            uncertain purity and potential for injection. This trend is shown in the visualization of CDC data bellow. "),
          plotlyOutput('trendPlot'),
          p("Source: State Death Records via 'Opioid-related Deaths in Washington State, 2006–2015' by Washington DOH"),
          br(),
          h2("Map of Seattle Area Overdose Deaths (2010 - 2017)"),
          p("Most data we have used in this project comes from the Seattle Police Department’s
            data releases about Police reports. A map of these incidents is shown below. You can click on each
            dot to display more information."),
          htmlOutput("frame"),
          p("Source: Seattle Police Report Database, Google Maps")
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
             mainPanel(
               h1("Guide for Implementation of Safe Injection Facilities"),
               h2("Location"),
               htmlOutput("frame2"),
               br(),
               p("This interactive map allows you to explore our proposed locations for the safe injection sites
                 in the context of each overdose death in the Seattle area."),
               h3('First Site'),
               plotOutput("downtownMap"),
               br(),
               p("As shown by the map of Seattle, there are three areas of notably high concentration 
                 of overdose deaths: Downtown Seattle, The University District, and the 1200 block of 
                 Aurora Ave N. The obvious first choice for a Safe Injection Facility would be a location 
                 that services downtown Seattle, shown in the map above. Downtown encompasses around 3.5% 
                 of the area of the city of Seattle, but sees nearly 33% of overdoses in the city. Westlake 
                 has the highest concentration of overdoses in the downtown area, so an SIF would be ideal 
                 in the Westlake area. However, the construction of such a site would receive much backlash 
                 from local corporations, and small businesses and may deter new business from building in 
                 Westlake. This could have a potentially negative impact on Downtown as a financial center 
                 and tourist destination, especially with the economic strength that the Waterfront tourism 
                 and rapid growth in nearby areas like South Lake Union brings to the Downtown area. While it 
                 has been proven in the Insite SIF study that an SIF does not increase the incidence of public 
                 injection in the vicinity of the SIF, the stigma of injection drug use could potentially damage
                 the reputation of the area. Instead I propose the first location for a Safe Injection Facility 
                 just south of Pioneer Square, where it can serve the high risk population of the downtown area 
                 while staying clear of the tourist center and financial heart of the city."),
               h3("Second Site"),
               plotOutput("northSeattleMap"),
               br(),
               p("Ideally, there would be three sites constructed in the city of Seattle to service the three 
                 areas of obvious high risk, however, the initial proposition is for the construction of only 
                 two facilities. In order to serve the maximum number of high risk individuals, the SIF would 
                 be located between the 1200 block of Aurora Ave and the U-District. This would mean a 
                 location in the area of the Green Lake and Phinney Ridge Neighborhoods, which are zoned mostly 
                 residential and have high property prices. To make an SIF even less feasible in this area, 
                 the residents of these neighborhoods are mostly higher income families who would adamantly 
                 oppose a SIF in their neighborhood. Although it would treat less of the high risk population, 
                 a facility in the U-District is much more feasible and still effective in servicing at risk 
                 individuals. A Safe Injection Facility in place of the U-District Needle Exchange (in the alley 
                 behind the Post Office at NE 43rd & Univ. Way NE. Seattle) is the ideal location for a facility 
                 in the U-District. While some may argue that the construction of an SIF within a block of the 
                 University would have an adverse effect on students, the reality is quite the opposite. The 
                 needle exchange simply hands out needles to IDU's to be used wherever they please, often in 
                 public in the direct vicinity of the UW campus. A Safe Injection Facility in place of the 
                 needle exchange would reduce the incidence of public injection in the area while providing 
                 the same services as the needle exchange along with additional important services such as 
                 on site medical staff to reduce or eliminate the number of overdoses in the U-District."),
               h2("Hours of Operation"),
               plotlyOutput("timeChart"),
               p("The data in the above chart shows the total number of overdoses by time of day. The lowest 
                 number of overdoses occur around 7 AM while the highest number of overdoses occur around 7 PM.
                 The number of overdoses reaches a high level around 11 AM and remains high until midnight, with 
                 a somewhat high level between midnight and 3 AM. To most effectively serve those in need, the Safe 
                 Injection Facilities should open around 11 AM and remain open until at least midnight and potentially
                 until 3 AM with reduced staff. As a 24 hour SIF seems unreasonable, the best hours for a facility 
                 to close would be between 4 AM and 11 AM, when overdose incidence is at its lowest."),
               h2("Timeframe for Implementation"),
               plotlyOutput("monthChart"),
               p("The chart above shows overdoses by month for 2016. The summer months from May through August appear
                 to have the highest number of overdoses for the year along with the month of November. September and 
                 October are exceptionally low compared to the rest of the data, September having a total just over 25% 
                 of the total for each summer month. Given this data, it is imperative the Safe Injection Facilities are 
                 open in time for the summer months to be as impactful as possible in the first year of operation.")
               )
    ),
    
    tabPanel('Sources / About',
             mainPanel(
               h1("Additional Information"),
               h2("Sources"),
               h3("Seattle Police 911 Response Database"),
               a("Link",
                 href="https://data.seattle.gov/Public-Safety/Seattle-Police-Department-911-Incident-Response/3k2p-39jp/data"),
               h3("King County Department of Health: Heroin and Opiod Trends"),
               a("Link",
                 href="http://www.kingcounty.gov/~/media/depts/community-human-services/behavioral-health/documents/herointf/heroin_opioid_trends_infographic.ashx?la=en"),
               h3("UW ADAI: 2015 Drug Use Trends in King County"),
               a("Link",
                 href="http://adai.uw.edu/pubs/pdf/2015drugusetrends.pdf"),
               h3("Insite Research Results"),
               a("Link",
                 href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1635777/"),
               h2("Authors"),
               h3("Conor Reiland"),
               h3("Warren Cho"),
               h3("Kyle Goodwin"),
               br()
  
             )
    )
  )
))
