library(plyr)
library(shiny);library(ggvis)
library(dplyr);
library(data.table)

library(janitor);library(lubridate)
library(tidyverse);
library(ggplot2);

##################
data0<-read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vROwDDAbMjQcvR2X5A7XMhmbd9yH-FhShgjR7xmaqXtokeuLplBcZmjvwwoAOiIwKhefBuCv8UcqoFJ/pub?gid=0&single=true&output=csv")
daterr<-data0
daterr$var<-paste(daterr$variable,",", daterr$units,sep="")
daterr$group<-paste(daterr$variable,", ",daterr$units,sep="")

vars<-c("all",daterr$var)

domains<-c("all",as.character(sort(unique(daterr$domain),decreasing=FALSE)))
classes<-c("all",as.character(sort(unique(daterr$class),decreasing=FALSE)))

categoricals<-c("none","class","domain","variable")



min(daterr$value)

