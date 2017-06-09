corr <- function(directory, threshold=0){
  # directory is the directory to pull files from
  # threshold is lowest count of pairs of observations allowed
  # return 0 if below threshold, else correlation between sulfate and nitrate
  files <- list.files(directory)
  corrs <- numeric()
  for (i in files){
    f <- read.csv(paste('specdata/',i,sep=""))
    c <- f[complete.cases(f),]
    if (nrow(c) >= threshold) {
      correlation <- cor(c$sulfate,c$nitrate)
      corrs <- append(corrs,correlation)
    }
  }
  corrs
}