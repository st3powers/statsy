
ui <- fixedPage(responsive=FALSE,  


navbarPage("statsy",
           p(a("statsy", href="statsy")),
  tabsetPanel(id = "tabs",         
  tabPanel("tab1",value="tab1",
           fixedRow(column(10,plotOutput("plot_one"))),
           h1(),
           fluidRow(column(6,selectInput("var", "Var:", choices=vars,selected=vars[1])),

)),


tabPanel("tab2",value="tab2",
fluidRow(tableOutput('tabledata_one'))
))
,
  


fluidRow(

column(4,selectInput("FilterDomains", "FilterDomain:", choices=domains,selected=domains[1])),
column(4,selectInput("FilterClasses", "FilterClasses:", choices=classes,selected=classes[1])))


                    
)
)


