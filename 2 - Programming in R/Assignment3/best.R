# best(state, outcome) returns the best hospital in the state for the specified illness

best <- function(state, outcome) {
  # Read data
  data <- read.csv("outcome-of-care-measures.csv", colClass = "character")
  # Check that state and outcome are valid
  if (!(state%in%data$State)){
    stop("invalid state")
  }
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  # simplify my data
  simp <- cbind(data[,2],data[,7],data[,11],data[,17],data[,23])
  simp <- data.frame(simp)
  colnames(simp) <- c("name","state.code","attack","failure","pneumonia")
  simp.state <- subset(simp, state.code == state)
  colnum <- if(outcome == "heart attack") {3} else if(outcome == "heart failure") {4} else {5}
  DATASET$NAME[DATASET$COLUMNNAME == min(DATASET$COLUMNNAME)]
  # # Return the hospital name of the hospital with the lowest 30-day death rate
  # 
}
