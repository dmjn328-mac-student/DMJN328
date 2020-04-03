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
  
ggplot(chathamkent4, aes(geometry=geometry, fill=percent))+geom_sf()+labs(title="Percent of population that commutes outside of Chatham-Kent")+scale_fill_distiller(palette="Dark2")+theme_void()

### Note that if you look in the help page for scale_fill_distiller, there are different sets of pre-made coloured palettes. Some are called sequential and some are called qualitative. There is a big difference. sequential palettes go step-by-step from a starting color to an end colour and they are useful when you are mapping a quantitative variable that has a lot of steps in between the lowest and the highest values. In this case, the qualitative category is al ittle better and the reason is that, although this is technically a quantitative variable (percent), there are actually clusters of people (e.g. commuters and non-commuters) in the differnt corners of the county. So, by showing this with a qualitative palette as opposed to a sequential palette, that pattern stands out more. 
ggplot(chathamkent4, aes(geomerty=geometry, fill=percent))+geom_sf()+labs(title="Percent of population that commutes outside of Chatham-Kent, qualitative scale")+scale_fill_distiller(palette="Accent")+theme_void()
ggplot(chathamkent4, aes(geomerty=geometry, fill=percent))+geom_sf()+labs(title="Percent of population that commutes outside of Chatham-Kent, sequential")+scale_fill_distiller(palette="Blues")+theme_void()

