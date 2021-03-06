Code Book
===========

### Variables Explanation

There are 68 variables in the tidy data. 66 of them are measurements, and the other 2 are the corresponding activity name and subject ID for the measurements. The explations for the variables are as follow (where ` ` represents elements in the variable names):

* `Activity`: It has 6 values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING), which represents activities carried out by the subject in the experiment.

* `Subject`: It has 30 values ranging from 1 to 30, which represents the identifier of the subject who carried out the experiment.

* (`t` or `f`)`BodyAcc-`(`mean()` or `std()`)`-`(`X` or `Y` or `Z`): The time (t) or frequency (f) domain body acceleration signal measured in mean (mean()) or standard deviation (std()) in X, Y or Z directions. The oberservations have been further averaged against each activity and each subject.

* (`t` or `f`)`BodyAccJerk-`(`mean()` or `std()`)`-`(`X` or `Y` or `Z`): The time (t) or frequency (f) domain body linear acceleration signal measured in mean (mean()) or standard deviation (std()) in X, Y or Z directions. The oberservations have been further averaged against each activity and each subject.

* (`t` or `f`)`BodyGyro-`(`mean()` or `std()`)`-`(`X` or `Y` or `Z`): The time (t) or frequency (f) domain body gyroscope signal measured in mean (mean()) or standard deviation (std()) in X, Y or Z directions. The oberservations have been further averaged against each activity and each subject.

* `tBodyGyroJerk-`(`mean()` or `std()`)`-`(`X` or `Y` or `Z`): The time domain body angular velocity signal measured in mean (mean()) or standard deviation (std()) in X, Y or Z directions. The oberservations have been further averaged against each activity and each subject.

* `tGravityAcc-`(`mean()` or `std()`)`-`(`X` or `Y` or `Z`): The time domain gravity acceleration signal measured in mean (mean()) or standard deviation (std()) in X, Y or Z directions. The oberservations have been further averaged against each activity and each subject.

* (`t` or `f`)`BodyAccMag-`(`mean()` or `std()`): The time (t) or frequency (f) domain body acceleration signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `tBodyAccJerkMag-`(`mean()` or `std()`): The time domain body linear acceleration signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `fBodyBodyAccJerkMag-`(`mean()` or `std()`): The frequency domain body linear acceleration signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `fBodyBodyGyroJerkMag-`(`mean()` or `std()`): The frequency domain body angular velocity signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `fBodyBodyGyroMag-`(`mean()` or `std()`): The frequency domain body gyroscope signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `tBodyGyroJerkMag-`(`mean()` or `std()`): The time domain body angular velocity signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `tBodyGyroMag-`(`mean()` or `std()`): The time domain body gyroscope signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

* `tGravityAccMag-`(`mean()` or `std()`): The time domain gravity acceleration signals' magnitude measured in mean (mean()) or standard deviation (std()). The oberservations have been further averaged against each activity and each subject.

### Data Transformation

The data set for this analysis is obtained from: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The transformation of data takes the following steps:

* Concatenate `training` and `test` data to create a complete data set with dimension of 561 columns by 10,299 rows.

* Add column names and extract variables that are the mean and standard deviation for each measurement, by searching and matching variable names that contain keywords `mean()` or `std()`. The transformed data set has a dimension of 66 columns by 10,299 rows.

* Bring the corresponding `acitivity ID` and `subject ID` to the observations of the transformed data set, thus the dimension of the transformed data set becomes: 68 columns by 10,299 rows.

* Replace `activity ID` from the transformed data with `activity label`, the new transformed data's dimension remains as 68 columns by 10,299 rows.

* The tidy data is created by taking the average of each measurement for each activity and each subject from the transformed data in the previous step. The tidy data is named `tidy_data.txt`, and saved as comma seperated text file in the working directory. It has a dimension of 68 columns by 180 rows, where each row represents the average of each variable for each activity and each subject.
