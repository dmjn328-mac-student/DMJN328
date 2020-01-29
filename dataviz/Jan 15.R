print("hello")

x <- rnorm(100)
plot(x)

max(j)
max(j, na.rm-T)

m<-"apples"

n<-apples

dates <-strptime(c("20200225230000", "20100226000000", "20100226010000"))

date1 <- strptime(c("20100225230000", "20100226000000", "20100226010000"), format=%y%m%d%h%m%s)

date1<-strptime(c("20100225230000", "20100226000000", "20100226010000"), 
                format = %y%m%d%h%m%s)

date1 <- strptime(c("20100225230000", "20100226000000", "20100226010000"), format="%Y%m%d%H%M%S")
above is not working

library(lubeidate)
install.packages("lubridate")

date2<-ymd.hms(c("20100225230000", "20100226000000", "20100226010000"))
date2 <- ymd.hms(c("20100225230000", "20100226000000", "20100226010000"))
could not do above

date1 <- ymd_hms(c("20100225230000", "20100226000000", "20100226010000"))




sample_df <- data.frame(id=c(1001,1002,1003,1004), name=c("Steve", "Pam", "Jim", "Dwight"), age=c(26, 65, 15, 7), race=c("White", "Black", "White", "Hispanic"))
sample_df$race <- factor(sample_df$race)
sample_df$id <- factor(sample_df$id)
sample_df$name <- as.character(sample_df$name)


str(sample_df)

first_number <- 10
second_number <-8

(second_number-first_number)/first_number*100

percent_change <- function(first_number, second_number) {
  pc <- (second_number-first_number)/first_number*100 return(pc)
}

percent_change(100, 80)
  
percent_change <- function(first_number, second_number) {
  pc <- (second_number-first_number)/first_number*100
  return(pc)
}

percent_change(100, 80)

percent_change("hundred", "eighty")

vec1 <-c(1, 4, 6, 8, 8, 10)
vec1
vec1[3]

vec2 <- seq(from=0, to=1, by=0.25)
vec2

sum(vec2)

vec1 + vec2

vec1+vec2

# matrices

not <- matrix(data=c(9, 2, 3, 4, 5, 6,), ncol=3)

not <- matrix(data=c(9, 2, 3, 4, 5, 6), ncol=3)
not

not[1, 2]
not[2, 3]

mean(not)

#data frames

patientID <- c(111, 208, 113, 408)
age <- c(25, 34, 28, 52)
sex <- c(1,2,1,1)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c(1,2,3,1)

patientdata <- data.frame(patientID, age, sex, diabetes, status)
patientdata

patientdata[1:2]

patientdata[c("diabetes", "status")]

patientdata$age

patientdata[2:3, 1:2]

mean(patientdata["age"])
mean(patientdata[["age"]])
mena(patientdata$age)
mean(patientdata$age)


# Lists



names(mylist)
g <- "My First List"
h <- c(25, 26, 18, 39)
# The line below is creating a matrix that's 5 rows deep of numbers 1 through(":") 10
j <- matrix(1:10, nrow = 5) 
k <- c("one", "two", "three")
mylist <- list(title = g, ages = h, j, k)

mylist[("ages")][[1]]

g <- "My First List"
h <- c(25, 26, 18, 39)
# The line below is creating a matrix that's 5 rows deep of numbers 1 through(":") 10
j <- matrix(1:10, nrow = 5) 
k <- c("one", "two", "three")
mylist <- list(title = g, ages = h, j, k) 

length(sample_df)

sample_df$name[1]

nchar(sample_df$name[1])

ncol(sample_df)

str(sample_df)
summary(sample_df)
rm(sample_df)

install.packages("usethis")

# This is for chapter 2 files and folders

usethis::use_course("https://github.com/r-journalism/learn-chapter-2/archive/master.zip")
