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





