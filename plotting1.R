## 1. Reading data. 
outcome <- read.csv("./Desktop/outcomeofcaremeasures.csv", colClasses = "character")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11]) ## plotting 30day mortality rates of Heart attack with a histogram. 