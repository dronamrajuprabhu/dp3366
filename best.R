best <- function(state, outcome) {
  
  data <- read.csv("./Desktop/outcomeofcaremeasures.csv", colClasses = "character")
  
  states <- data[ , 7]
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if ((state %in% states) == FALSE) {
    stop(print("invalid state"))
  }
  else if ((outcome %in% outcomes) == FALSE) {
    stop(print("invalid outcome"))
  }
  
  new_data <- subset(data, State == state)
  
  if (outcome == "heart attack") {
    outcome_column <- 11
  }
  else if (outcome == "heart failure") {
    outcome_column <- 17
  }
  else {
    outcome_column <- 23
  }
  
  required_columns <- as.numeric(new_data[,outcome_column])
  bad <- is.na(required_columns)
  desired_data <- new_data[!bad, ]
  
  columns_considered <- as.numeric(desired_data[, outcome_column])
  desired_rows <- which(columns_considered == min(columns_considered))
  desired_hospitals <- desired_data[desired_rows, 2]
  
  if (length(desired_hospitals) > 1) {
    hospitals_sorted <- sort(desired_hospitals)
    hospitals_sorted[1]
  }
  else {
    desired_hospitals
  }
}