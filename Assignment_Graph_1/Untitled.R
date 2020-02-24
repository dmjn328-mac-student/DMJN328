library(tidyverse)
crime<-read.csv(file='crime.csv')
ontario<-crime %>% 
  filter(GEO=='Ontario')
toronto<-crime %>% 
  filter(GEO=='Toronto, Onatrio')

