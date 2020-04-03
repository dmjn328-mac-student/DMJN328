#install.packages("cancensus")
library(cancensus)

#file.edit(file.path("~/.Rprofile"))

options(cancensus.api_key='CensusMapper_c962d3bc839ccaf7962dee9ce9b10623')

wasaga_beach <- 
  get_census(dataset='CA16',
             regions=list(CSD="3543064"), 
             vectors=c(), 
             labels="detailed",
             geo_format="sf", 
             level='DA')

library(tidyverse)

ggplot(wasaga_beach, aes(geometry=geometry))+geom_sf()


ggplot(wasaga_beach, aes(geometry=geometry, fill=Population))+geom_sf()


wasaga_beach2 <- get_census(dataset='CA16', 
                          regions=list(CSD="3543064"), 
                          vectors=c("v_CA16_244"), 
                          labels="detailed", 
                          geo_format="sf", 
                          level='DA')

glimpse(wasaga_beach2)

#use rename() command

wasaga_beach2 %>%
  rename("Seniors"=`v_CA16_244: 65 years and over`)-> wasaga_beach3


ggplot(wasaga_beach3, aes(geometry=geometry, fill=Seniors))+geom_sf()


## comments for Brendan
## You might want to convert these to Percentages

wasaga_beach3 %>% 
  mutate(percent=(Seniors/Population)*100) %>% 
  ggplot(., aes(geometry=geometry, fill=percent))+geom_sf() +
  #Then add a title and stuff
labs(title="Percentage of Census Tracts in WB over 65")+
  #Turn off the grey screen
  theme_void()

## Great work! It's an interesting pattern. What is it about that area that means old people like to live there? Golf courses? REtirement buildings?


