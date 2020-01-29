View(murders)
source("import_murders.R")
getwd

View(murders)


nrow(murders)
# Make a list of cities based on the unique() function
how_many <- unique(murders$MSA_label)

# Count up how many are in the list
length(how_many)

glimpse(murders)


df1 <- filter(murders, Relationship_label=="Husband", VicAge > 60, Year==2016)

# same as the line above
df2 <- filter(murders, Relationship_label=="Husband" & VicAge > 60 & Year==2016) 

df3 <- filter(murders, Relationship_label %in% c("Husband", "Boyfriend") |
                Circumstance_label=="Lovers triangle")

