# Analysis of spam data
# followed along from a lecture

library(kernlab)
data(spam)

set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, prob =.5)
trainSpam <- spam[trainIndicator == 1,]
testSpam <- spam[trainIndicator == 0,]

# Looking at capital letters
capitalCorrelation <- plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)

# paris plot
parisPlot <- plot(log10(trainSpam[, 1:4]+1))

# clustering
hClustering <- hclust(dist(t(log10(trainSpam[,1:55]+1))))
