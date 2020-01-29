install.packages("readxl")
getwd()
library(readxl)
drug_deaths <- read_excel("excel/data/statisticssummary.xls",skip=2)
getwd()
drug_deaths <- read_excel("data/statisticssummary.xls", skip=2)
colnames(drug_deaths)
drug_deaths$"othercases"
drug_deaths$'other cases'
#the line above didn't work this is where I got stuck
colnames(drug_deaths) <- make.names(colnames(drug_deaths))
colnames(drug_deahts)[colnames(drug_deaths)]=="fiscal.year......7.1.6.30"]<-"year"
