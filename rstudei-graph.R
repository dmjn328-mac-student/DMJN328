df <- read.csv("graph_data.csv", stringsAsFactors=F)
?read_csv
head(df)
gather
View(df2)
library(tidyverse)
df %>% 
  gather(key="date", value="crossing",2:6) ->df2
glimpse(df2)
#getting date right 
library(lubridate)
?paste
df2$date <-paste("01.",df2$date, sep="") 
str(df2)
dmy(df2$date)
df2$date<-dmy(df2$date)
str(df2)

df2 %>%
mutate(crossing=as.numeric(str_replace_all(crossing, ",", ""))) %>% 

filter(Trip.characteristics!="Total vehicles entering Canada") ->df3
glimpse(df3)
view(df3)

str(df3)

library(ggthemes)
library(ggplot2)
ggplot(data=df3) +
  geom_point(mapping=aes(x=date, y=crossing)) +
  geom_abline(intercept=1, col="purple") 
  geom_segment(
    aes(x=0, 
        ))

ggplot(df3, 
  aes(x=date, y=crossing, color=crossing)) +
  geom_point() +
  theme()+
  labs(title='People Entering Canada by Car',
       subtitle='Over a 5 month Period')  


  


  
  