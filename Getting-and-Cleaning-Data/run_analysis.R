## run_analysis.R
## Getting and Cleaning Data Course Project
## This program does the following:
## 0. Download the data for the project
## 1. Merges the training and the test sets to create one data set
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject
##

## 0. Download the data for the project
if (!dir.exists("UCI HAR Dataset")){
      datafile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      dir.create("UCI HAR Dataset")
      download.file(datafile,"UCI-HAR-dataset.zip") # method = "curl"
      unzip("./UCI-HAR-dataset.zip")
}

## 1. Merges the training and the test sets to create one data set
if (!require("data.table")){
      install.packages("data.table")
}
require("data.table")

# read the training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            header = FALSE)
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                             header = FALSE)
features_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                             header = FALSE)

# read the test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           header = FALSE)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                             header = FALSE)
features_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                             header = FALSE)

# merge the training and the test data
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train, features_test)

# assign variable names
colnames(subject) <- "subject"
colnames(activity) <- "activity"
feature_names <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- t(feature_names[2])

# merge into a single dataset: data
data <- cbind(subject, activity, features)


## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement
# extract the column indices that have mean or std
# ind <- grep("mean|std*", names(data), ignore.case=TRUE)
# the above includes unnecessary terms: e.g.col 82-88
ind <- grep("mean\\(\\)|std\\(\\)", names(data), ignore.case=TRUE)

# add subject and activity column to the indices
ind <- c(1,2,ind)
# slice the data to object a data set containing only the required measurements
# data_extract
data_extract <- data[,ind]
# check the names
names(data_extract)


## 3. Uses descriptive activity names to name the activities in the data set
# get the activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                             header = FALSE)
# change activity from numeric to character 
data_extract$activity <- as.character(data_extract$activity)
# assign activity labels
for (i in 1:6){
      data_extract$activity[data_extract$activity == i] <-
            as.character(activity_labels[i,2])
}
# factor the activity 
data_extract$activity <- as.factor(data_extract$activity)

# head(data_extract$activity) # 6 levels of activity

## 4. Appropriately labels the data set with descriptive variable names
# examine the names
names(data_extract)

# replace t by Time
names(data_extract) <- gsub("^t","Time Domain:",names(data_extract))
# replace f by Frequency
names(data_extract) <- gsub("^f", "Frequency Domain:", names(data_extract))
# replace Acc by Acceleration
names(data_extract) <- gsub("Acc", " Acceleration", names(data_extract))
# replace Gyro by Angular Velocity
names(data_extract) <- gsub("Gyro", " Angular Velocity", names(data_extract))
# replace Jerk by Jerk Signal
names(data_extract) <- gsub("Jerk", " Jerk Signal", names(data_extract))
# replace Mag by Magnitude
names(data_extract) <- gsub("Mag", " Magnitude", names(data_extract))
# replace BodyBody by Body
names(data_extract) <- gsub("BodyBody", "Body", names(data_extract))

# examine the names
names(data_extract)


## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject
# set subject as a factor variable
data_extract$subject <- as.factor(data_extract$subject)
# head(data_extract$subject) # 30 levels of subject

# enhance data frame
data_extract <- data.table(data_extract)

# apply aggregate to obtain the mean, 30 subjects*6 activities = 180 obs
# new data set data_tidy
data_tidy <- aggregate(.~ subject + activity, data_extract, mean) 
# sort the data by subject then by activity level
data_tidy <- data_tidy[order(data_tidy$subject, data_tidy$activity),]

# save the tidy data set as "tidy_data.txt" 
write.table(data_tidy, file = "tidy_data.txt", row.names = FALSE)


