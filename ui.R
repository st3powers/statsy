
################
#
#ui <- fluidPage(

ui <- fixedPage(responsive=FALSE,  


navbarPage("stasty",
           p(a("statsy", href="statsy")),
#           p("https://www.epa.gov/national-aquatic-resource-surveys/nla"),
  tabsetPanel(id = "tabs",         
  tabPanel("tab1",value="tab1",
           fixedRow(column(10,plotOutput("plot_one"))),
           h1(),
           fluidRow(column(6,selectInput("var", "Var:", choices=vars,selected=vars[1])),
#            column(2,offset=1,checkboxInput("addpoints", "show points?", value = FALSE)),
#           column(2,offset=0,checkboxInput("logcheck", "log10 transform?", value = FALSE)),
#           column(2,offset=0,checkboxInput("violinplot", "violin plot?", value = FALSE))),
#           p("TukeyHSD comparison statistics"),
#           fluidRow(column(12,verbatimTextOutput("onesummary")))
)
),
  
  fluidRow(
  column(4,selectInput("facet", "facet:", choices=categoricals,selected=categoricals[1])),
  column(4,selectInput("grouping1", "Grouping1:", choices=categoricals,selected=categoricals[1])),
  column(4,selectInput("grouping2", "Grouping2:", choices=categoricals,selected=categoricals[1])))


                    
)
)
)
#)

