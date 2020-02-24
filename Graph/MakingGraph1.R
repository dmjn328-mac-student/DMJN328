library(ggplot2)
ggplot(tidy_race2= Years, 
       aes(Track_Conditions, fill=Location))+
  geom_bar(position = "dodge")

# Bar Graph with Attendance
ggplot(tidy_race2,
       aes(x=Attendance)) +
  geom_bar()
 # Bar Graph with Track Conditions
ggplot(tidy_race2,
       aes(x=Track_Conditions)) +
  geom_bar()

# Stacked Bar Graph with Attendance and Track Conditions
ggplot(tidy_race2,
       aes(x=Track_Conditions, fill = Attendance)) +
  geom_bar()

ggplot(tidy_race2,
       aes(x= Attendance, fill = Track_Conditions)) +
  geom_bar()

#Grouped Bar Plot 
ggplot(tidy_race2,
       aes(x= Attendance, fill = Track_Conditions)) +
  geom_bar(position = "dodge")

# % Bar Chart
ggplot(tidy_race2,
       aes(x= Attendance, fill = Track_Conditions)) +
  geom_bar(position = "fill")

ggplot(tidy_race2,
       aes(x= Location, fill = Attendance)) +
  geom_bar(position = "fill")
