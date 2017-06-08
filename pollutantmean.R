pollutantmean <- function(directory, pollutant, id = 1:332) {
  # directory is the directory to find the files in
  # pollutant is either 'nitrate' or 'sulfate'
  # id is a vecotor of files to analyze, defaulting to all 332
  # goal is to find the mean of the specified pollutant in the specified files
  files <- list.files(directory)[id]
  total <- data.frame()
  for (i in files){
    f <- read.csv(paste('specdata/',i,sep=""))
    total <- rbind(total, f)
    #partialsum <- sum(f$pollutant, na.rm = TRUE)

  }
  total
}