#All of my code from import, cleaning and plotting

#Import my data

#source("importdata.R")

getwd()

library(readr)

spotify_global<-read_csv("data/spotify_global_2019_most_streamed_tracks_audio_features.csv")

#Clean my data 
###This command was unnecesary. 
#source("importdata.R")

library(dplyr)
library(stringr)
library(tidyverse)

spotify_tidy <- spotify_global %>%
  filter(Rank<11)
#We could reorder the track names by their rank, most popular track to the least popular. But that means we have to keep the track variable. 

#Note: in your code, you saved over spotify_tidy every time, which is OK. But it's a moderately good idea to not save over stuff so you can go back up and make changes. 

spotify_tidy2 <- select(spotify_tidy, "Track Name", danceability, speechiness, Rank)

spotify_tidy3 <- rename(spotify_tidy2, Danceability=danceability, Speechiness=speechiness, Song="Track Name")
names(spotify_tidy3)
spotify_tidy4 <- gather(spotify_tidy3, key="Factor", value="Measurement", 2:3)
head(spotify_tidy4)
#Plot my data


spotify_tidy4

library(ggplot2)
library(forcats)
#The command fct_reorder reorders the first factor by the values in the second (Rank. )
str(spotify_tidy4)
ggplot(spotify_tidy4, aes(x=fct_reorder(Song, desc(Rank)), y=Measurement, fill=Factor)) + 
  geom_col(position="dodge") +
  labs(title="Danceability and Speechiness of Spotify's 2019 Top 10", caption="Source: https://www.kaggle.com/prasertk/spotify-global-2019-moststreamed-tracks", x="Song") +
  scale_fill_manual(values=c("Darkgreen", "Chartreuse")) + theme_bw() + theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    #I'm not sure this line does anything
  #  axis.line = element_line(colour = "black"),
    plot.caption = element_text(hjust = 0))+
  #This turns the x-axis on the side, it can be useful for x-axis with long labels
  coord_flip()
##The only thing is that we kind of want the most popular song at the top. The way to do that is to go back and change the fct_reorder command to descend. 

ggplot(spotify_tidy4, aes(x=fct_reorder(Song, desc(Rank)), y=Measurement, fill=Factor)) + 
  geom_col(position="dodge") +
  labs(title="Danceability and Speechiness of Spotify's 2019 Top 10", caption="Source: https://www.kaggle.com/prasertk/spotify-global-2019-moststreamed-tracks", x="Song") +
  scale_fill_manual(values=c("Darkgreen", "Chartreuse")) + theme_bw() + theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    #I'm not sure this line does anything
    #  axis.line = element_line(colour = "black"),
    plot.caption = element_text(hjust = 0))+
  #This turns the x-axis on the side, it can be useful for x-axis with long labels
  coord_flip()







