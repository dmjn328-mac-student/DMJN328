#install.packages("cancensus")
library(cancensus)
library(tidyverse)
options(cancensus.api_key='CensusMapper_c03463c155b66300457731f29ae7b036')
options(cancensus.cache_path = "~")


chathamkent2<- get_census(dataset='CA16', regions=list(CSD="3536020"), vectors=c("v_CA16_5786", "v_CA16_5816"), labels="detailed", geo_format="sf", level='DA')

library(ggplot2)
ggplot(chathamkent2, aes(geometry=geometry, fill=Population))+geom_sf()

ggsave("chathamkent.jpg")

chathamkent3<-rename(chathamkent2, "Commuters" = "v_CA16_5786: Commute to a different census subdivision (CSD) and census division (CD) within province or territory of residence")

names(chathamkent3)

library(ggplot2)
ggplot(chathamkent3, aes(geometry=geometry, fill=Commuters))+geom_sf()

chathamkent4<-mutate(chathamkent3, percent=(Commuters/Population)*100)

library(ggplot2)
ggplot(chathamkent4, aes(geomerty=geometry, fill=percent))+geom_sf()

ggsave("chathamkent4.jpg")  
  
  