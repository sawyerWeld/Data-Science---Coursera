# Script for Course Project

# Ensure dataset is present

filename <- "raw_dataset"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}

# Unzip dataset

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read in the 6 activities as text

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])

# Read in the 561 features as text

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Get features which contain "mean" or "std"

featuresMeanStd <- grep(".*mean.*|.*std.*",features[,2])
featuresMeanStd.names <- features[featuresMeanStd,2]

# Make names of features better as recommended by someone on Coursera
# Things like this are part of tidy data that often I forget about
# Also the regex in R is wonky coming from Java

featuresMeanStd.names <- gsub('-mean','Mean',featuresMeanStd.names)
featuresMeanStd.names <- gsub('-std','Std',featuresMeanStd.names)
featuresMeanStd.names <- gsub('[-()]','',featuresMeanStd.names)

# Load in the data marked as "Training" and "Testing" and bind
# Seems silly that training and test would be pre-seperated
# You'd think you'd randomize that and provide the seed
# But this is why we tidy things up
# Also rm as we go to conserve RAM

trainingX <- read.table('UCI HAR Dataset/train/X_train.txt')[featuresMeanStd]
trainingY <- read.table('UCI HAR Dataset/train/y_train.txt')
trainingSubjects <- read.table('UCI HAR Dataset/train/subject_train.txt')
train <- cbind(trainingSubjects, trainingY, trainingX)
rm(trainingX,trainingY,trainingSubjects)

testingX <- read.table('UCI HAR Dataset/test/X_test.txt')[featuresMeanStd]
testingY <- read.table('UCI HAR Dataset/test/y_test.txt')
testingSubjects <- read.table('UCI HAR Dataset/test/subject_test.txt')
test <- cbind(testingSubjects, testingY, testingX)
rm(testingX,testingY,testingSubjects)

data <- rbind(test,train)
colnames(data) <- c('subject','activity',featuresMeanStd.names)

rm(test,train)





