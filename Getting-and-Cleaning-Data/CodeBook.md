# Code Book for ![run_analysis.R](run_analysis.R)
## Raw Data
The data used in ![run_analysis.R](run_analysis.R) represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data can be downloaded from: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

The zipped file contains the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Variables 
The variables generated in ![run_analysis.R](run_analysis.R) are the following:

* subject_train: data frame containing training data of subject, 7352 obs. of 1 variable
* activity_train: data frame containing training data of activity, 7352 obs. of 1 variable
* features_train: data frame containing training data of features, 7352 obs. of 561 variables
* subject_test: data frame containing test data of subject, 2947 obs. of 1 variable
* activity_test: data frame containing test data of activity, 2947 obs. of 1 variable
* features_test: data frame containing test data of features, 2947 obs. of 561 variables
* subject: data frame containing both training and test data of subject, 10299 obs. of 1 variable
* activity: data frame containing both training and test data of activity, 10299 obs. of 1 variable
* features: data frame containing both training and test data of features, 10299 obs. of 561 variables
* feature_names: data frame containing labels of the features and the corresponding descriptive names, 561 obs. of 2 variables
* data: data frame containing all the training and test data, 10299 obs. of 563 variables
* ind: numeric array containing the desired column indices for data frame slicing, 1:68
* data_extract: data frame containing the extracted data which includes only the measurements on the mean and standard deviation of each measurements.
* activity_labels: data frame containing labels of the activity and the corresponding descriptive names, 6 obs. of 2 variables
* data_tidy: data frame containing an independent tidy data set with the average of each variable for each activity and each subject, 180 obs. of 68 variables


## Operations performed in ![run_analysis.R](run_analysis.R)
* Download the data for the project
  1. Check whether the folder with the name "UCI HAR Dataset" exists
  2. If not, create a folder "UCI HAR Dataset"
  3. Download and unzip the data file into the local folder "UCI HAR Dataset"
  
* Merge the training and the test sets to create one data set: data
  1. Check whether the package "data.table" is ready. If not, install it. Require the package "data.table"
  2. Read the training data sets into data frames: subject_train, activity_train & features_train
  3. Read the test data sets into data frames: subject_test, activity_test & features_test
  4. Merge the training and the test data into single data frames: subject, activity & features
  5. Assign variables names using "subject", "activity" and feature_names from features.txt
  6. Merge all the data into a single data set: data
  
* Extract only the measurements on the mean and standard deviation for each measurement: data_extract
  1. Extract the column indices that have mean or std: ind
  2. Add subject and activity column to the array "ind"
  3. Slice the data frame "data" to object the desired data set "data_extract"
  
* Use descriptive activity names to name the activities in the data set
  1. Get the activity labels: activity_labels
  2. Change activity from numeric to character
  3. Assign activity labels from "activity_labels" to "data_extract"
  4. Factor the activity in "data_extract"
  
* Appropriately label the data set with descriptive variable names
  1. Examine the names of "data_extract"
  2. Replace "t" in the names of "data_extract" by "Time"
  3. Replace "f" in the names of "data_extract" by "Frequency"
  4. Replace "Acc" in the names of "data_extract" by "Acceleration"
  5. Replace "Gyro" in the names of "data_extract" by "Angular Velocity"
  6. Replace "Jerk" in the names of "data_extract" by "Jerk Signal"
  7. Replace "Mag" in the names of "data_extract" by "Magnitude"
  8. Replace "BodyBody" in the names of "data_extract" by "Body"
  
* Using "data_extract", create a second, independent tidy data set with the average of each variable for each activity and each subject: data_tidy
  1. Set subject in "data_extract" as a factor variable
  2. Enhance the data frame "data_extract"
  3. Apply aggregate to obtain the mean of each variable for each activity and each subject in a new data set: data_tidy
  4. Sort "data_tidy" by subject then by activity level
  5. Save the tidy data set "data_tidy" as ![tidy_data.txt](tidy_data.txt) 



