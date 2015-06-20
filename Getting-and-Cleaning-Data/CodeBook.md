# Code Book for run_analysis.R
## Raw Data
The data used in run_analysis.R represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

It can be downloaded from: 

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
The variables generated in run_analysis.R are the following:

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


## Operations
0. The data set is downloaded and unzipped in the local working directory with folder name, UCI HAR Dataset
1. The training and test data sets are merged into one data set: data
2. The measurements on the mean and standard deviation for each measurements are extracted from the data set "data" to form another data set: data_extract
3. The names of the activities in the data set "data_extract" are re-named using descriptive activity names
4. The names of the variables/features in the data set "data_extract" are labels using descriptive variable names
5. Using "data_extract", a second, independent tidy data set "data_tidy" is created which contains the average of each variable for each activity and each subject



