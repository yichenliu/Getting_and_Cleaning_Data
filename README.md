Description of run_analysis.R
=========================

###Before You Start

Please download the data from link below, and extract it to any directory.
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Set working directory to the extratced data folder (i.e. `C:/UCI HAR Dataset/`) and execute every line in `run_analysis.R`. The comma seperated tidy data will be created in your working directory, and named: `tidy_data.txt`.

###Key Attributes

* Training and test measurements are extracted from `./train/X_train.txt` and `./test/X_test.txt`. And measurement names are extracted from `./features.txt`.

* Training and test subject IDs are extracted from `./train/subject_train.txt` and `./test/subject_test.txt`.

* Training and test activity IDs are extracted from `./train/y_train.txt` and `./test/y_test.txt`.

* All test data sets are concatenated below training data sets to ensure consistency.

* The transformed data is constructed by extracting measurements with names containing `mean()` or `std()` only. Corresponding subject ID and activity label have been merged with the transformed data as well.

* Tidy data is constructed by taking the average of each measurement for each activity and each subject from the transformed data.

###The Scripts

The scripts in run_analysis.R is made up of 5 steps:

* Concatenate `training` and `test` data, through `rbind()`, to create a complete data set (named `df_step1`), where `test` data is concatenated below `training` data.

* Working on `df_step1`, name each variable based on `features.txt`. Then, extract variables that are the mean and standard deviation for each measurement, by searching and matching variable names that contain keywords `mean()` or `std()`. Name the transformed data set as `df_step2`.

* Use `cbind()` to bring the corresponding `acitivity ID` and `subject ID` to the observations from the transformed data set (`df_step2`). Where `test` IDs are concatenated below `training` IDs to match the data structure in `df_step1`. Name the transformed data set with corresponding IDs as `df_step3`.

* Use `merge()` and `subset` to replace `activity ID` from transformed data (`df_step3`) with `activity label`. Name the new transformed data set as `df_step4`.

* Use `df_step4` from step 4 to create a tidy data set with the average of each measurement for each activity and each subject. Name the tidy data set as `tidy_data`, and save it as a comma seperated text file: `tidy_data.txt`.
