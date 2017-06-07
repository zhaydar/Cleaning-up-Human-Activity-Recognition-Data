########################################################################
## This script does the following:
## 
## 0) Downloads HAR dataset from UCI open data repository and extracts
##    all files to local working directory "./data"
## 
## 1) Merges the training and the test sets to create one data set.
## 
## 3) Uses descriptive activity names to name the activities in the data set
## 
## 4) Appropriately labels the data set with descriptive variable names.
## 
## 2) Extracts only the measurements on the mean and standard deviation
##    for each measurement.
## 
## 5) From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity and
##    each subject.
## 
########################################################################


## Install and load necessary R packages/libraries

if (!require("data.table")) install.packages("data.table")
library(data.table)

if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

if (!require("tidyr")) install.packages("tidyr")
library(tidyr)


## Create local "data" directory, download and unzip dataset into it.

if (!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./data/HAR.zip")) download.file(fileUrl, destfile="./data/HAR.zip")
if (file.exists("./data/HAR.zip")) unzip("./data/HAR.zip", junkpaths=TRUE, exdir="./data", unzip="internal")
setwd("./data")


## Read in the features.txt file, and store it in data.frame "features"
## These will later be used as the column headings (vars) of 
## the merged measurement data set
features <- read.table("features.txt", header=FALSE)
## Add "Subject" & "Activity" var names to the list of 561 vars
features <- transpose(rbind(slice(features, 1:2),features))
features[2,2] <- "Subject"
features[2,1] <- "Activity"
## Clean-up: delete the resulting extra 1st row
features <- features[-1,]


## Read in the activity_labels.txt file, and store it in data.frame "activities"
activities <- read.table("activity_labels.txt", header=FALSE)
## Delete the resulting 1st column in activities
activities[1] <- NULL


## Read in the y_train.txt and y_test.txt and merge them
## in that same order using rbind() into a y_merged
y_train <- read.table("y_train.txt", header=FALSE)
y_test <- read.table("y_test.txt", header=FALSE)
y_merged <- rbind(y_train, y_test)
## for loop to replace activity numbers by activity names in y_merged
i <- 1
for (i in 1:6) {
  y_merged <- mutate(y_merged, V1 = ifelse(V1 == as.character(i), as.character(activities[i,1]), V1))
  i <- i+1
}


## Read in the subject_train.txt and subject_test.txt and merge them
## in that same order using rbind() into a subject_merged
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
subject_merged <- rbind(subject_train, subject_test)


## Read in the X_train.txt and X_test.txt and merge them
## in that same order using rbind() into a X_merged
X_train <- read.table("X_train.txt", header=FALSE)
X_test <- read.table("X_test.txt", header=FALSE)
X_merged <- rbind(X_train, X_test)


## Combine all the data frames together with proper column labels
X_merged <- cbind(y_merged, subject_merged, X_merged)
colnames(X_merged) <- features[1,]

########################################################################
## 2) Extracts only the measurements on the mean and standard deviation
##    for each measurement.
########################################################################
colsToKeep <- grep("mean",colnames(X_merged))
colsToKeep2 <- grep("std",colnames(X_merged))
colsToKeep <- c(1, 2, colsToKeep, colsToKeep2)
X_merged2 <- X_merged[, colsToKeep]

########################################################################
## 5) From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity and
##    each subject.
########################################################################

X_merged3 <- slice(X_merged2, 1:180)

i <- 1
j <- 0

for (i in 1:30) {

  X_temp <- filter(X_merged2, Subject == i)

  X_merged3[(i+j):(i+j+5),] <- aggregate(X_temp[,2:81], list(X_temp$Activity), mean)
  
  X_merged3[(i+j):(i+j+5),2] <- i
  
  i <- i+1
  j <- j+5

}

write.table(X_merged3, file="X_merged3.txt", row.name=FALSE)
View(X_merged3)
