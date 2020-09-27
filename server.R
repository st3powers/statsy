
server <- function(input, output, session) {

  daterr_one<- reactive({
    if(input$var=="all"){one<-daterr}
    if(input$var!="all"){one<-subset(daterr,daterr$var==input$var)}
    filtered<-one
    if(input$FilterDomains!="all"){filtered<-filtered %>% filter(domain==input$FilterDomains)}
    if(input$FilterClasses!="all"){filtered<-filtered %>% filter(class==input$FilterClasses)}
    filtered$var<-paste(filtered$var," ", filtered$domain,sep="")
    
    powers<-log10(filtered$value) %>% trunc()
    quantiles<-quantile(powers,probs=c(0.1,0.9))
    which_low<-powers<quantiles[1]
    which_high<-powers<quantiles[2]
    
#    filtered$value[which_low]<-filtered$value[which_low]*10^(as.numeric(round(quantiles[1])))
#    filtered$value[which_high]<-filtered$value[which_high]*10^(-1*as.numeric(round(quantiles[1])))
    
#    filtered$var[which_low]<-paste(filtered$var," / ", 10^(as.numeric(round(quantiles[1]))))
#    filtered$var[which_high]<-paste(filtered$var," * ", 10^(as.numeric(round(quantiles[1]))))
    
    filtered
  })
  
  output$plot_one<-renderPlot({
    plotit1<-ggplot(daterr_one(),aes(x=var,y=value)) +
      geom_bar(stat="identity")+
      coord_flip()+
      theme_bw()+
      theme(strip.text = element_text(size = rel(1), vjust = 0), 
            panel.spacing = unit(0, "lines"),
            axis.text = element_text(colour = "black", size = 12),
            axis.title = element_text(colour = "black", size = 16)
            )
  plotit1
  })
  
  output$tabledata_one<-renderTable(daterr_one(),digits=3,spacing="xs")
  
}
  