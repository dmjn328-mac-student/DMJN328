library(ggplot2)
library(sf)
library(tidyverse)

options(device = "X11")
X11.options(type = "cairo")

canada_location <- c("gpr_000b11a_e.shp")

canada <- st_read(canada_location)

library(readr)

wastedata <- read_csv("Waste_Data.csv")

library(dplyr)

canada <- left_join(canada, wastedata,
                    by=c("PRENAME"="GEO"))

options(scipen = 999)

ggplot(canada) +
  geom_sf(aes(fill=VALUE))+
  scale_fill_distiller(direction=1)+
  labs(title="Production of Waste by Province", 
       caption="Retrieved from StatCan",
       subtitle="(2016)")

##Great work Liz. You might want to make a new variable that shows what percent of Canada's total each province makes. 
  names(canada)
  canada %>% 
    mutate(percent_total=(VALUE/sum(VALUE)*100))-> canada
  
  ggplot(canada) +
    geom_sf(aes(fill=percent_total))+
    scale_fill_distiller(direction=1)+
    labs(title="Production of Waste by Province", 
         caption="Retrieved from StatCan",
         subtitle="(2016)")
