#importing my data

library(cancensus)

census_data <- get_census(dataset='CA16', regions=list(CSD="3525005"), vectors=c("v_CA16_43","v_CA16_64"), labels="detailed", geo_format=NA, level='CT')

#second try - without data 
ham <- get_census(dataset='CA16', regions=list(CSD="3525005"), vectors=c(), labels="detailed", geo_format="sf", level='CT')

library(tidyverse)
glimpse(ham)
library(ggplot2)
ggplot(ham, aes(geometry=geometry))+
  geom_sf()

#adding data/vectors
ham2 <- get_census(dataset='CA16', regions=list(CSD="3525005"), vectors=c("v_CA16_64"), labels="detailed", geo_format="sf", level='CT')
glimpse(ham2)

ham3 <-rename(ham2, "Youth"='v_CA16_64: 15 to 19 years')

ggplot(ham3, aes(geometry=geometry, fill=Youth))+
  geom_sf()

#changing youth to be a % of the population
ham4 <-mutate(ham3, percent=(Youth/Population)*100)

ggplot(ham4, aes(geometry=geometry, fill=percent))+
  geom_sf()

#adding a third variable (population by sex)
ham5 <- get_census(dataset='CA16', regions=list(CSD="3525005"), vectors=c("v_CA16_65","v_CA16_66"), labels="detailed", geo_format="sf", level='CT')
glimpse(ham5)
names(ham5)
ham6 <-rename(ham5, Male=15, Female=16)
ham7<-gather(ham6, Sex, n, Female, Male)

ggplot(ham7, aes(geometry=geometry, fill=n))+
  geom_sf()+
  facet_wrap(~Sex)

#making my map look pretty 
library(viridis)
ggplot(ham7, aes(geometry=geometry, fill=n))+
  geom_sf()+
  facet_wrap(~Sex)+
  scale_fill_viridis(direction=-1)+
  scale_color_viridis(direction=-1)+
  theme_minimal()+
  theme(text=element_text(size=16,  family="Calibri Light"))+
  labs(title="Percent of Youth (15 to 19) Population in Hamilton by Sex", caption="Source: StatsCan")

#what i want to do next - change the colours of the map

#playing with fonts
windowsFonts()
library(extrafont)


#making sexs a percentage of the population
ham8 <-mutate(ham7, percent=(n/Population)*100)

ggplot(ham8, aes(geometry=geometry, fill=percent))+
  geom_sf()+
  facet_wrap(~Sex)+
  scale_fill_viridis(direction=-1)+
  scale_color_viridis(direction=-1)+
  theme_minimal()+
  theme(text=element_text(size=16,  family="Calibri Light"))+
  labs(title="Percent of Youth (15 to 19) Population in Hamilton by Sex", caption="Source: StatsCan")+
  scale_fill_gradient(low="darkslategray1", high = "gray48")
  
#Final Graph