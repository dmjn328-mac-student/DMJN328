library(tidyverse)
library(tidyr)
library(readr)
library(dplyr)
crime<- read.csv("crime.csv", stringsAsFactors=F)
install.packages("rmarkdown")
install.packages("tidyverse")
Toronto<-filter(crime,GEO=='Toronto, Ontario')
Toronto1<-filter(Toronto,Violations=='Attempted murder')
Toronto2<-filter(Toronto1,Age.of.victim=='Total, age of victim')
library(ggplot2)
ggplot(data=Toronto2) +
  geom_point(mapping=aes(x=REF_DATE, y=Age.of.victim)) + 
  expand_limits(x = 0, y = 0) +
  geom_abline(intercept=0, col="light gray")