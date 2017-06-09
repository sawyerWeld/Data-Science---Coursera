corr <- function(directory, threshold=0){
  # directory is the directory to pull files from
  # threshold is lowest count of pairs of observations allowed
  # return 0 if below threshold, else correlation between sulfate and nitrate
  source("complete.R")
  complete(directory, 1:2)
}