# Please download the data from link below, and extract it to any directory.
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Set working directory to the extratced data folder (i.e. "C:/UCI HAR Dataset/")
# This R script does the following:


# 1. Concatenate "training" and "test" data, through rbind(), to create
#    a complete data set (named "df_step1"), where "test" data is concatenated
#    below "training" data.

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
df_step1 <- rbind(train,test)


# 2. Working on "df_step1", name each variable based on "features.txt".
#    Then, extract variables that are the mean and standard deviation
#    for each measurement, by searching and matching variable names that
#    contain keywords "mean()" or "std()". Name the transformed data set
#    as "df_step2".

measurement_label <- read.table("features.txt")
names(df_step1) <- as.character(measurement_label[,2])
means <- df_step1[,grep("mean()",names(df_step1),fixed=TRUE)]
stds <- df_step1[,grep("std()",names(df_step1),fixed=TRUE)]
df_step2 <- cbind(means,stds)


# 3. Use cbind() to bring the corresponding acitivity ID and subject ID to the 
#    observations from the transformed data set ("df_step2"). Where "test" IDs are 
#    concatenated below "training" IDs to match the data structure in "df_step1".
#    Name the transformed data set with corresponding IDs as "df_step3".

activity_train <- read.table("train/y_train.txt")
activity_test <- read.table("test/y_test.txt")
activity_complete <- rbind(activity_train,activity_test)
names(activity_complete) <- "Activity_ID"

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_complete <- rbind(subject_train,subject_test)
names(subject_complete) <- "Subject"

df_step3 <- cbind(activity_complete,subject_complete,df_step2)


# 4. Use merge() and subset to replace activity IDs from transformed data 
#    ("df_step3") with activity labels. Name the new transformed data set
#    as "df_step4".

activity_label <- read.table("activity_labels.txt")
names(activity_label) <- c("Activity_ID","Activity")

df_step4 <- merge(activity_label,df_step3,all=TRUE)
df_step4 <- df_step4[,c(2:69)]


# 5. Use "df_step4" from step 4 to create a tidy data set with the average 
#    of each variable for each activity and each subject. Name the tidy 
#    data set as "tidy_data", and save it as "tidy_data.txt"

tidy_data <- aggregate(df_step4[,3:68],by=list(df_step4$Activity,df_step4$Subject),mean)
colnames(tidy_data)[c(1,2)] <- c("Activity","Subject")
write.table(tidy_data,"tidy_data.txt",sep=",",row.names=FALSE)