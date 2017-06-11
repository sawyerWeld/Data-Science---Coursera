complete <- function(directory, id = 1:332) {
  # directory is the directory to find the files in
  # id is a vecotor of files to analyze, defaulting to all 332
  # goal is to make a df with the file number 'id' and the num of complete cases 'nobs'
  files <- list.files(directory)[id]
  total <- data.frame(id = numeric(), nobs = numeric())
  for (i in files){
    f <- read.csv(paste('specdata/',i,sep=""))
    c <- f[complete.cases(f),]
    total[nrow(total)+1,] = c(f[1,]$ID,nrow(c))
  }
  total
}