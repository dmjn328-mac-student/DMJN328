#importing region of Markham
markham <- get_census(dataset='CA16', regions=list(CSD="3519036"), vectors=c(), labels="detailed", geo_format="sf", level='DA')
library(tidyverse)
glimpse(markham)
library(ggplot2)
ggplot(markham, aes(geometry=geometry))+geom_sf()
#markham2 <- get_census(dataset='CA16', regions=list(CSD="3519036"), vectors=c("v_CA16_3403"), labels="detailed", geo_format="sf", level='DA')
#trying to import average income
markham2 <- get_census(dataset='CA16', regions=list(CSD="3519036"), vectors=c("v_CA16_4957"), labels="detailed", geo_format="sf", level='DA')

glimpse(markham2)
names(markham2)
#making map with average
markham3 <- rename(markham2, "AverageIncome"="v_CA16_4957: Average total income in 2015 among recipients ($)")
ggplot(markham3, aes(geometry=geometry, fill=AverageIncome))+geom_sf()

#importing average with male and female
markham6 <- get_census(dataset='CA16', regions=list(CSD="3519036"), vectors=c("v_CA16_4958","v_CA16_4959"), labels="detailed", geo_format="sf", level='DA')
glimpse(markham6)
markham7 <- rename(markham6, "MaleIncome"=`v_CA16_4958: Average total income in 2015 among recipients ($)`,"FemaleIncome"=`v_CA16_4959: Average total income in 2015 among recipients ($)`)
glimpse(markham7)
#trying again
#markham3 <- get_census(dataset='CA16', regions=list(CSD="3519036"), vectors=c("v_CA16_4952","v_CA16_4951","v_CA16_4953"), labels="detailed", geo_format="sf", level='DA')
#glimpse(markham3)
#markham4 <- rename(markham3, "MaleIncome"=`v_CA16_4952: Total - Income statistics in 2015 for the population aged 15 years and over in private households - 25% sample data`,"FemaleIncome"=`v_CA16_4953: Total - Income statistics in 2015 for the population aged 15 years and over in private households - 25% sample data`)

#names(markham4)
#trying each variable
ggplot(markham7, aes(geometry=geometry, fill=FemaleIncome))+geom_sf()
ggplot(markham7, aes(geometry=geometry, fill=MaleIncome))+geom_sf()
#adding third variable ish
markham8 <- gather(markham7, Sex, n, FemaleIncome, MaleIncome)
glimpse(markham8)

ggplot(markham8, aes(geometry=geometry, fill=n))+
  geom_sf()+
  facet_wrap(~Sex)+
scale_fill_distiller(palette="RdPu")+
  labs(title="Average Income in Markham shown by Male and Female")
  
  
  
