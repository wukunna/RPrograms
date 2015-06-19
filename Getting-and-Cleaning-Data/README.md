# Geting and Cleaning Data
## Course Project

The goal of this project is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

In this project, we will create one R script called run_analysis.R that does the following:

   0. Downloads the data file to the working directory. 
   1. Merges the training and the test sets to create one data set. 
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the activities in the data set. 
   4. Appropriately labels the data set with descriptive activity names. 
   5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



## What you find in this repository

CodeBook.md: descriptions of the variables, the data, and transformations/work that performed in run_analysis.R to clean up the data 

README.md: this file

run_analysis.R: R script for this project

tidy_data.txt: the text file containing the second, independent tidy data set with the average of each variable for each activity and each subject


