#This lists the packages to be installed
install.packages("tidyverse")
install.packages("car")
install.packages("remotes")
#Install from github
remotes::install_github("kjhealy/socviz") 

library(ggplot2)
var1<-seq(1,100,1)
var2<-seq(1,100,1)

qplot(var1,var2, geom='point', main='if you get this plot, things are working. ')
ggsave('test_plot_1.png')
library(car)
library(tidyverse)
var3<-sample(c('A', 'B', 'C'), 100, replace=T)
var4<-Recode(var3, "'A'='Apple'; 'B'='Banana' ; 'C'='Cactus'")
data.frame(var3, var4) %>% 
  ggplot(., aes(x=var4))+geom_bar()+labs(title='IF you get this plot too things are working. ')
ggsave('test_plot_2.png')
