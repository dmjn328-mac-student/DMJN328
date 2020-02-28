
getwd()
source("import_murders.r")
how_many <- unique(murders$MSA_label)
library(dplyr)
length(how_many)
glimpse(murders)
#didn't work:
df1 <- filter(murders,Relationship_label=="Husband", VicAge > 60, Year==2016)
# same as the line above
df2 <- filter(murders, Relationship_label=="Husband" & VicAge > 60 & Year==2016) 

df3 <- filter(murders, Relationship_label=="Husband" | Relationship_label=="Boyfriend" | Relationship_label=="Lovers Triangle")
df1_narrow <- select(df1, State, Agency, Solved_label, Year, Month_label)  

df1_narrow <- select(df1, State, Agency, Solved_label:Year) 

labels_only_columns <- select(murders, contains("_label"))

age_df1 <- arrange(murders, VicAge)   

agedf1 <- filter(age_df1, OffAge!=999)
murders_ver2 <- mutate(murders, age_difference=OffAge-VicAge, 
                       new_column=VicAge-OffAge)

murders_ver3 <- mutate(murders, age_difference=OffAge-VicAge,
                       vic_category=case_when(
                         VicRace_label == "White" ~ "White",
                         VicRace_label != "White" ~ "Non-White"
                       ))

                         
      #didn't work                 )

colnames(df1_narrow)

df1_renamed <- rename(df1_narrow,
                      Solved=Solved_label,
                      Month=Month_label)
head(df1_renamed)
summarize(murders, average_vicAge=mean(VicAge))

murders_filtered <- filter(murders,OffAge!=999)

summarize(murders_filtered, average_vicAge=mean(VicAge), average_offender_age=mean(OffAge))

summarize(murders_filtered,
          first=min(Year),
          last=max(Year),
          metro_areas=n_distinct(MSA_label), 
          cases=n())


#group by

murders <- group_by(murders, MSA_label)
summarize(murders,
          first=min(Year),
          last=max(Year),
          cases=n())
#what is MSA???
murders$MSA_label
#option 1

dc_annual_murders1 <- filter(murders, State == "District of Columbia")
dc_annual_murders2 <- group_by(dc_annual_murders1, Year)
dc_annual_murders3 <- summarize(dc_annual_murders2, total=n())
dc_annual_murders4 <- arrange(dc_annual_murders3, desc(total))

# very powerful he says: %>%

filter(murders, OffAge==2)

murders %>% filter(OffAge==2)  

#A PIPE IS LIKE 'AND THEN'

murders %>% filter(State=="District of Columbia") %>% 
  group_by(Year) %>%
  summarize(total=n()) %>%
  arrange(desc(total))


# Control + shift + m = %>%


years <- murders %>% filter(State=="District of Columbia") %>% 
  group_by(Year) %>%
  summarize(total=n()) %>%
  mutate(previous_year=lag(total)) %>% 
  mutate(change=previous_year-total)
 
#didn't work with second mutate??
murders()
#not working:

years %>% mutate(all_murders=sum(total))


getwd()


murders %>%
  group_by(State, Year) %>%
  summarize(cases=n(), solved=sum(Solved_value))

murders %>% group_by(VicRace_label) %>% count()

library(DT)

unsolved <- murders%>%
  group_by(MSA_label,Solved_label)%>%
  filter(Year> 2008)%>%
  summarize(cases=n())

datatable(unsolved)

#didn't work becasue of percent??
murders %>%
  group_by(MSA_label,Solved_label)%>%
  filter(Year> 2008)%>%
  summarize(cases=n())%>%
  mutate(percent=cases/sum(cases)*100)%>%
  datatable()

  
#didn't work becasue of percent??
murders %>%
  group_by(MSA_label,Solved_label)%>%
  filter(Year> 2008)%>%
  summarize(cases=n())%>%
  filter(cases>10)%>%
  mutate(percent=cases/sum(cases)*100)%>%
  filter(Solved_label=="No")%>%
  select(Metro=MSA_label, cases_unsolved=cases,percent_unsolved=percent)%>%
  datatable()

murders %>%
  group_by(MSA_label,VicRace_label,Solved_label)%>%
  filter(Year> 2008)%>%
  summarize(cases=n())%>%
  mutate(percent=cases/sum(cases)*100)%>%
  datatable()
