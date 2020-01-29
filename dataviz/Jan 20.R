#----- XLSX Files Module -----
install.packages(readxl)
install.packages("readxl")
getwd()
library(readxl)
#must download the excel flie to the computer
drug_deaths <- read_excel("users/user/Desktop/DMJN328/dataviz/assets")
drug_deaths <- read_excel("DrugDeaths10xlsx(1).xlx")
#I cannot get this to download, he says to read it where it is stored but I do not understand where it is store or what name to use. It is saved in DMJN328, dataviz - assest
dug_deaths <- read_excel("DMJN328/dataviz/data.xlsx")
#could not do rest of the video

#add skip2 to skip however many NA/blank lines you want or need
#colnames(drug_deaths) <- make.makes(colnames(drug_deaths))
#to change colum name -- colnames(drug_deaths)[colnames(drug_deaths)] = "name of colum" <- new name

#drug_deaths <- subset(drug_deaths, !is.na(Year))
#drug_deaths <-filter(drug_deaths, !is.na(Year))

#better to save dateframes as csv files over xlsx

#--------- SPSS Files Module --------
#Statisctical packages for the Social Sciences

install.packages("foreign")
library(foreign)
data.lables <- read.spss("data/UCR1965_2018.sav", to.data.frame=TRUE)

data_only <- read.spss("data/UCR1965_2018.sav", use.value.labels =F, to.data.frame =TRUE)

library(dplyr)
colnames(data.lables)
#is not working with data_lables, only data.lables

new_labels <- select(data.labels,
                     ID, CNTYFIPS, Ori, State, Agency, AGENCY_A,
                     Agentype_label=Agentype,
                     Source_label=Source,
                     Solved_label=Solved,
                     Year,
                     Month_label=Month,
                     Incident, ActionType,
                     Homicide_label=Homicide,
                     Situation_label=Situation,
                     VicAge,
                     VicSex_label=VicSex,
                     VicRace_label=VicRace,
                     VicEthnic, OffAge,
                     OffSex_label=OffSex,
                     OffRace_label=OffRace,
                     OffEthnic,
                     Weapon_label=Weapon,
                     Relationship_label=Relationship,
                     Circumstance_label=Circumstance,
                     Subcircum, VicCount, OffCount, FileDate,
                     fstate_label=fstate,
                     MSA_label=MSA)
#could not get this to run because I was having issues with data.lables
new_data <-cbind(data.lables, data_only)
