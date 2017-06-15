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
  # get only the columns i want to work with and the rows of the state
  simp <- cbind(data[,2],data[,7],data[,11],data[,17],data[,23])
  simp <- data.frame(simp)
  colnames(simp) <- c("name","state.code","attack","failure","pneumonia")
  simp.state <- droplevels(subset(simp, state.code == state))
  #coerce data to numbers and return name of min value
  colnum <- if(outcome == "heart attack") {3} else if(outcome == "heart failure") {4} else {5}
  simp.state$name <- as.character(simp.state$name)
  c <- as.character(simp.state[,colnum])
  c <- suppressWarnings(as.numeric(c))
  minrow <- which(c == min(c,na.rm=TRUE))
  simp.state[minrow,1]
}
