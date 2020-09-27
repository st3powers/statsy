
server <- function(input, output, session) {

  daterr_one<- reactive({
    if(input$var=="all"){one<-daterr}
    if(input$var!="all"){one<-subset(daterr,daterr$var==input$var)}
    
    filtered<-one
    if(input$facet=="none"){filtered$facet<-""}
    if(input$facet=="class"){filtered$facet<-as.factor(filtered$class)}
    if(input$facet=="domain"){filtered$facet<-as.factor(filtered$domain)}
    if(input$facet=="variable"){filtered$facet<-as.factor(filtered$variable)}
#    filtered$facet<-as.factor(input$facet)
    if(input$grouping1=="none" & input$grouping2=="none"){filtered$group<-"all"}
    if(input$grouping1!="none"){filtered$group<-filtered[,input$grouping1]}
    if(input$grouping2!="none"){filtered$group<-paste(filtered$group,",",filtered[,input$grouping2],sep="")}
    if(input$grouping1=="none" & input$grouping2!="none"){filtered$group<-filtered[,input$grouping2]}
    filtered
    
  })
  
  output$plot_one<-renderPlot({
    plotit1<-ggplot(daterr_one(),aes(x=factor(group),y=value)) +
#      geom_boxplot()+
      geom_bar(stat="identity")+
      facet_wrap(~facet)+
#      geom_violin()+
#      geom_jitter(alpha=0.25,size=0.75)+
  #    xlab("group")+
  #    ylab(input$var)+
  #    scale_x_discrete(limits = rev(levels(factor(daterr_one()$group))))+
  #    coord_flip()+
      theme_bw()+
      theme(strip.text = element_text(size = rel(1), vjust = 0), 
            panel.spacing = unit(0, "lines"),
            axis.text = element_text(colour = "black", size = 12),
            axis.title = element_text(colour = "black", size = 16)
            )
  plotit1
  })
  
  
  
}
  