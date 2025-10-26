rm(list=ls()) #removes all variables stored prevously

if(!require(Hmisc)) install.packages("Hmisc",repos = "http://cran.us.r-project.org")
library(Hmisc)

data <- read.csv("raw_data/COVID19_line_list_data.csv")
describe(data) #Hmisc command

#wyczyszczona kolumna death
#wynikiem jest wektor logiczny (TRUE / FALSE): TRUE, jeśli death ≠ 0 FALSE, jeśli death = 0
data$death_dummy <- as.integer(data$death != 0)

#death rate
sum(data$death_dummy) / nrow(data)

#age
#claim 1: people who die from COVID-19 are older than people who survive 
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)

#ignore every entry where age is unknown (NA)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# is this statistacilly significant? 
t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.95)

#the difference between the person whos dead and alive in age is from 24 y to 17 y
#so on average the person who is alive is much younger than the one whos dead

#p-value < 2.2e-16 probability is close to 0
#so 0% chance that the ages of two populations are equal
#normally, if p-value < 0.05, we rejest null hypothesis
#this is statically significant, ppl who die from COVID are much older than the ppl who dont die from COVID 



