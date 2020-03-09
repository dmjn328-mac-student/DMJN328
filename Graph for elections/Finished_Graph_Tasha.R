
#trying a different website

library(rvest)

url <- "https://www.elections.ca/content.aspx?section=ele&dir=turn&document=index&lang=e"

url
#I don't know if this did anything? Can't read?

webpage <- read_html("https://www.elections.ca/content.aspx?section=ele&dir=turn&document=index&lang=e")
webpage[2]
html_node(webpage)
webpage %>% 
  html_node("table") %>% 
html_table()->elections
elections
library(stringr)

library(dplyr)

names(elections)
#rename

elections <- rename(elections, Date=`Date of election/referendum`)
names(elections)

#using number position to rename

elections <- rename(elections, Electors=3)

elections <- rename(elections, Ballots=4)


elections <- rename(elections, Turnout=`Voter turnout(%)`)
names(elections)
#subbing out 

str_replace(elections$Date,"Footnote 1","")

elections$Date <- str_replace(elections$Date,"Footnote 1","")

elections$Date <- str_replace(elections$Date,"Footnote 2","")

elections$Date <- str_replace(elections$Date,"Footnote 3","")

#subbing out in next category turnout

elections$Turnout <- str_replace(elections$Turnout,"Footnote 4","")

elections$Turnout <- str_replace(elections$Turnout,"Footnote 5","")

#fixing dates

elections$Date <- str_replace(elections$Date,"- 20 September ","")

elections$Date <- str_replace(elections$Date,"- 12 October ","")


#selecting certain data

library(dplyr)

elections <- select(elections, Date, Electors, Turnout)

#making a graph

library(ggplot2)

#library is ggplot2 the function is just ggplot

ggplot(data=elections)+
  geom_bar(mapping=aes(x=Date, y=Turnout), stat="identity")

#making characters into numbers
str(elections)

as.numeric(elections$Turnout)

#trying to figure out how to make range 0-100

ggplot(data=elections)+
  geom_bar(mapping=aes(x=Date, y=as.numeric(elections$Turnout)),stat="identity")+
  ylim(0, 100)

#Trying to rename axis name


### Another way:
##Save the as.numeric version of elections$Turnout as the variable.
##Here we are just overwriting the old turnout variable with the numeric version of it. 

elections$Turnout<-as.numeric(elections$Turnout)

#Fixing dates
str(elections)
#dates is a character now, we want to change to a date variable

#install.packages("lubridate")

library(lubridate)



#first_election <- "August 7 1967"

#dmy(first_election)


#Tried this didn't work

elections$Date <- dmy(elections$Date)

elections$Date

str(elections)

##Run the gtraph again
##Notice we don't need to use as.numeric in the gglot command, because we kind of did it in the line above.

#Final Graph

ggplot(data=elections)+
  geom_bar(mapping=aes(x=Date,fill=Turnout, y=Turnout),stat="identity")+
  ylim(0, 100)+labs(y="Turnout")+
  scale_x_date(date_breaks = "20 years")

## Some changes.
ggplot(data=elections)+
  geom_bar(mapping=aes(x=Date,fill=Turnout, y=Turnout),stat="identity")+
  ylim(0, 100)+labs(y="Turnout")+
  scale_x_date(date_breaks = "20 years")+theme_bw()

#Some changes
ggplot(data=elections)+
  #I would take the fill command out; you're already showing the turnout with the height of the bar; adding a fill adds ink, but no more information. 
  geom_bar(mapping=aes(x=Date,y=Turnout),stat="identity")+
  ylim(0, 100)+labs(y="Turnout", x="Date")+
  #scale_x_date has a lot of functionality. setting date_labels only prints the Year, setting the breaks to be #elections$Date only prints years that have an election in them 
 scale_x_date(date_labels="%Y", breaks=elections$Date)+
  #this just makes things cleaner
  theme_minimal()+
  #coord_flip rotates so the x-axis is on the side; it can be a way of dealing with long text labels
  coord_flip()+
  #Add some labels
  labs(title="Turnout in Canadian Elections, 1867-2019", caption="Source: Elections Canada")












