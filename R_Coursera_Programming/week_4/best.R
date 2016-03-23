best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.CSV", header = TRUE)
  
  ## Check that state and outcome are valid
  if (state %in% data[,7] == FALSE) {
    stop(print("invalid state"))
  }
  
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (outcome %in% outcomes == FALSE) {
     stop(print("invalid outcome"))  
  }
    
  ## Return hospital name in that state with lowest 30-day death
  keepcols <- c("Hospital.Name", "State",
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  statedf <- subset(data, State == state, select = keepcols)
  names(statedf)  <- c("Hospital name","State", "heart attack", "heart failure", "pneumonia")
  statedf <- statedf[statedf[[outcome]] != "Not Available", ]
  statedf[[outcome]] <- as.numeric(as.character(statedf[[outcome]]))
 
  positions <- order(statedf[[outcome]], statedf[["Hospital name"]], 
                     decreasing = FALSE, na.last = TRUE)
  largest_first_df <- statedf[positions, ]
  
  ## rate
  largest_first_df[1,1]
}
