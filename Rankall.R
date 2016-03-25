rankall <- function(outcome, num = "best") {
  ## Reading the outcome data
  data <- read.csv("./Desktop/outcomeofcaremeasures.csv", colClasses = "character",na.strings="NA")
  
  ## Checking validity of states and outcomes.
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = sort(unique(data[,7]))
  if (!state %in% validState) stop("invalid state")
  
  ## converting  outcome name -> column name
  fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  colName <- fullColName[match(outcome,validOutcome)]
  
  ## get hospitals based on ranks
  hospital<-character(0)
  
  for (i in seq_along(validState)) {
    ## 30-day death rate being the rank returning hospitals in states.
    data.state <- data[data$State==validState[i],]
    
    # sorting the order data with outcome
    sorted.data.state <- data.state[order(as.numeric(data.state[[colName]]),data.state[["Hospital.Name"]],decreasing=FALSE,na.last=NA), ]
    
    #handling the num input
    this.num = num
    if (this.num=="best") this.num = 1
    if (this.num=='worst') this.num = nrow(sorted.data.state)
    
    hospital[i] <- sorted.data.state[this.num,"Hospital.Name"]
  }
  
  ## Hospitals names in short and state names.
  data.frame(hospital=hospital,state=validState,row.names=validState)
}