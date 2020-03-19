#install.packages("cancensus")
library(cancensus)
options(cancensus.api_key='CensusMapper_c03463c155b66300457731f29ae7b036')
options(cancensus.cache_path = "~")


chathamkent<- get_census(dataset='CA16', regions=list(CSD="3536020"), vectors=c(), labels="detailed", geo_format="sf", level='DA')

library(ggplot2)
ggplot(chathamkent, aes(geometry=geometry))+geom_sf()

ggsave("chathamkent.jpg")
