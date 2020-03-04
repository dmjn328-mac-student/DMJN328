source("TidyingData.R")

library(ggplot2)
str(tidy_race2)


table(tidy_race2$Year)

ggplot(tidy_race2,
       aes(x=Year, y= Attendance, fill=Track_Conditions))+
  geom_bar(stat="identity",
           position="dodge")+
  facet_wrap(~Location)
  
ggplot(tidy_race2,
       aes(x=Year, y= Attendance, fill=Location))+
  geom_bar(stat="identity",
           position="dodge")+
  facet_wrap(~Track_Conditions)

#Hi Simon this is my final graph code please use this
ggplot(tidy_race2,
       aes(x=Year, y= Attendance, fill=Track_Conditions))+
  geom_bar(stat="identity",
           position="dodge")+
  facet_wrap(~Location)+
  scale_fill_manual(values=c("darkslategray3", "darkslategray2", "darkslategrey"))+
  theme_minimal()

