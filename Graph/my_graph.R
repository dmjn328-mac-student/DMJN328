#import my data
library(tidyverse)
tab<-read.csv("Data/fulldata.csv")
head(tab)
names(tab)
tab$GEO
table(tab$GEO)
table(tab$Size.of.enterprise, tab$Gender)
table(tab$Type.of.corporation, tab$Gender)
table(tab$Industry, tab$Gender)

table(tab$Gender, tab$Type.of.corporation)
tab %>% 
  select(Gender, Industry, VALUE, Unit.of.measure) %>% 
  filter(Unit.of.measure == "Number")
  View()
  #trying to make bar graph 
  filter(tab, Industry=="Total, all industries")
  tab %>% 
    filter(Industry!="Total, all industries") %>% 
  ggplot(.,aes(x=Industry,fill=Gender)) +
    geom_bar() +
    coord_flip()+
  #trying to change colour
  scale_fill_manual(values=c("hotpink", "deepskyblue2"))+
  #trying to add title
labs(title= "Female and Male CEO's in Canada by Indsutry")

#im confused
  table(tab$Gender, tab$Industry, tab$VALUE)

###It doesn't really make a lot of sense to table tab$VALUE, because VALUE is a number
## table() is good for categorical variables with only a few categories.


#fixing graph
  tab %>% 
    select(Gender, Industry, VALUE, Unit.of.measure) %>% 
    filter(Unit.of.measure == "Number") %>%
##You forgto to add a pipe to this below, so it stopped running 
###also, you you don't need tab, here, because it is working with the results from above, so delete it. 
    filter(tab, Industry=="Total, all industries") %>%
##Then you can delete this line (I 'm just commenting this out)
  # tab %>% 
#Delete this too
#    filter(Industry!="Total, all industries") %>% 
### you just forgot the filter() command
#Also, you don't need the quotes around REF_DATE
   filter(REF_DATE=="2016") %>%
    ggplot(.,aes(x=Industry,y=VALUE,fill=Gender)) +
    geom_bar() 

## So clean those lines up by deleting stuff that is commented out, add in your lines setting colors and titles doing the coord_flip()
   
  
