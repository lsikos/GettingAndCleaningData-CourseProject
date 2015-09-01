# Instructions
#-------------------------------------------------------------------------------------------
# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#-------------------------------------------------------------------------------------------

# load packages
library(dplyr)
library(tidyr)
library(data.table)

## read data
setwd("/Users/lsikos1/Coursera/GettingAndCleaningData/")
dirs <- c("UCI HAR Dataset/",
          "UCI HAR Dataset/train/",
          "UCI HAR Dataset/test/",
          "UCI HAR Dataset/train/Inertial Signals/",
          "UCI HAR Dataset/test/Inertial Signals/")
for (dir in dirs) {
       setwd(dir) 
       files <- as.character(list.files(pattern='.txt'), full.names=T)
       for (f in 1:length(files)) {
               # get file name
               name <- unlist(strsplit(files[f],'\\.txt'))[1]
               # exclude README and features_info files
               if (name != "README" & name != "features_info") {
                       assign(name, read.table(files[f]))
               }
       }
       setwd("/Users/lsikos1/Coursera/GettingAndCleaningData/")
}

# Identify training and test participants
subs_train  <- unique(subject_train[,1])
subs_test  <- unique(subject_test[,1])

# Unify pieces of training data set
data_train <- cbind(y_train, X_train) # add numeric activity lables
data_train <- cbind(subject_train, data_train) # add subject ids

# Unify pieces of test data set
data_test <- cbind(y_test, X_test) # add numeric activity lables
data_test <- cbind(subject_test, data_test) # add subject ids

## Merge training and test data
data <- rbind(data_train, data_test)

# add header
header <- as.character(features[ ,2]) # convert features to character vector
names(data) <- c("subject","activity", header) # add features as header to data

## Extract only measurements on mean and stdev for each measurement

####  Note: header contains duplicated variable names, which causes problems for select()
####    data <- select(data, contains("mean"))                       
####    Error: found duplicated column name
####  therefore need to remove those cols before using select()

data  <- data[ , !duplicated(header)] # remove cols with duplicated col names
data <- data[ , grepl("subject|activity|mean()|std()", colnames(data))]


## Use descriptive activity names to name the activities in the data set



# convert numeric activity labels to descriptive labels
for (i in 1:length(activity_labels)) {
        data$activity[ data$activity == i] <- activity_label[i] 
}  
# use apply-split instead
a <- data$activity
l <- split(data, a)
l <- lapply(l, )

## Appropriately label data set with descriptive variable names

## From the data set in step 4, creates a second, independent tidy data set with the 
## average of each variable for each activity and each subject.




