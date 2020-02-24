#Tidying Data
library(tidyverse)

race<-read.csv("Data/Track Conditions.csv")


race %>% 
  select(year, track_condition, attendance, race) ->cle_race

#remember to run tidy verse and select all to reopen the tables
#ctrl Shift Enter to run everything that has been coded already

#making the column names nice and neat
tidy_race <- rename(cle_race, Year=year, Track_Conditions=track_condition, Attendance=attendance, Location=race)

tidy_race2 <- arrange(tidy_race, Year)


