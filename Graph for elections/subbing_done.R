
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
