rm(list=ls()) #removes all variables stored prevously

if(!require(Hmisc)) install.packages("Hmisc",repos = "http://cran.us.r-project.org")
library(Hmisc)

data <- read.csv("raw_data/COVID19_line_list_data.csv")
describe(data) #Hmisc command

data$death_dummy <- as.integer(data$death != 0)
