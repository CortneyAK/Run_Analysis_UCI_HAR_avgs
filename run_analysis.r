# Step 1: Download project files from: 
  # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Step 2: Place unzipped project files in desired directory

# Step 3: To prevent you from having to change directories, copy and paste the 
  #following files from their subfolders into the main "UCI HAR Dataset" folder:
        #from "test": subject_test.txt, X_test.txt, y_test.txt
        #from "train": subject_train.txt, X_train.txt, y_train.txt
              
# Step 4: Set your working directory

# Step 5: If you have not installed the r package 'tidyverse', do this now using:
      # (install.packages("tidyverse"))

# Step 6: Paste all the code in to console and hit return. You can do this by 
  # selecting all, then copy all, then paste all into the console.
  # Note: 2 datasets will appear in 'source' after code has run: 
    #"dataset" (full dataset of means & std's before summarizing) and 
    #"datasetavg" (average of each variable for each activity and each subject)

#-------------------------------------------------------------------------------
#This section brings the test dataset together:

library(tidyverse)
set_test <- read.table("X_test.txt")       ##get test raw test data
var_names <- read.table("features.txt")    ##get raw test data variable names
var_names <- var_names[,2]                 ##subset to column with variable names
vec_1 <- var_names                         ##vectorize variable names
colnames(set_test) <- vec_1                ##apply variable names to column names

act_id_test <- read.table("y_test.txt")           ##get test-activity ids
colnames(act_id_test)<- "activity_id"             ##assign name to variable
activity_code <- c(walking=1, walkingupstairs=2,  ##code to pair id w/activity
    walkingdownstairs=3, sitting=4, standing=5,
    laying=6)
act_id_test$activity <-                           ##change id to activity type
    names(activity_code)[match(act_id_test$activity, activity_code)]
activity_test <- act_id_test                      ##rename table for clarity
set_test_act <- cbind(activity_test$activity, set_test) ##bind activity to raw test data

sub_id_test <- read.table("subject_test.txt")    ##get test-subject ids
colnames(sub_id_test) <- "subject"               ##assign name to variable
set_test_sub_act <- cbind(sub_id_test, set_test_act)  ##bind subject ids to raw test data
dataset_test <- set_test_sub_act                 ##give test dataset more descriptive name
colnames(dataset_test)[2] <- "activity"          ##fix activity variable name

#-------------------------------------------------------------------------------
#This section brings the training dataset together:

set_train <- read.table("X_train.txt")     ##get raw training data
var_names <- read.table("features.txt")    ##get raw training data variable names
var_names <- var_names[,2]                 ##subset to column with variable names
vec_1 <- var_names                         ##vectorize variable names
colnames(set_train) <- vec_1               ##apply variable names to column names

act_id_train <- read.table("y_train.txt")         ##get training-activity ids
colnames(act_id_train)<- "activity_id"            ##assign name to variable
activity_code <- c(walking=1, walkingupstairs=2,  ##code to pair id w/activity
                   walkingdownstairs=3, sitting=4, standing=5,
                   laying=6)
act_id_train$activity <-                          ##change id to activity type
  names(activity_code)[match(act_id_train$activity, activity_code)]
activity_train <- act_id_train                    ##rename table for clarity
set_train_act <- cbind(activity_train$activity, set_train ) ##bind activity to raw training data

sub_id_train <- read.table("subject_train.txt")  ##get training-subject ids
colnames(sub_id_train) <- "subject"              ##assign name to variable
set_train_sub_act <- cbind(sub_id_train, set_train_act)  ##bind subject ids to raw training data
dataset_train <- set_train_sub_act               ##give training dataset more descriptive name
colnames(dataset_train)[2] <- "activity"         ##fix activity variable name

#-------------------------------------------------------------------------------
#This section appends the training dataset to the test dataset:
dataset_full <- rbind(dataset_train, dataset_test)

#-------------------------------------------------------------------------------
#This section selects only the mean and standard deviation variables from the dataset:
dataset <- dataset_full %>% select(contains("mean()") | contains("std") | 
            contains("subject") | contains ("activity"))

#-------------------------------------------------------------------------------
#This section renames the variables in more descriptive ways and re-orders the
#columns. There is probably a more elegant and efficient way to do this, but this
#works anyway:
colnames(dataset) <- c("acceleration_time_mean_x", "acceleration_time_mean_y", 
          "acceleration_time_mean_z",     
          "gravity_acceleration_time_mean_x", "gravity_acceleration_time_mean_y", 
          "gravity_acceleration_time_mean_z",
          "acceleration_jerk_time_mean_x", "acceleration_jerk_time_mean_y", 
          "acceleration_jerk_time_mean_z",
          "gyroscope_time_mean_x", "gyroscope_time_mean_y", "gyroscope_time_mean_z",
          "gyroscope_jerk_time_mean_x", "gyroscope_jerk_time_mean_y", 
          "gyroscope_jerk_time_mean_z",
          "acceleration_magnitude_time_mean_x", "acceleration_magnitude_time_mean_y", 
          "acceleration_magnitude_time_mean_z",
          "gyroscope_magnitude_time_mean_x", "gyroscope_magnitude_time_mean_y", 
          "gyroscope_magnitude_time_mean_z",
          "acceleration_freq_mean_x", "acceleration_freq_mean_y", 
          "acceleration_freq_mean_z",
          "acceleration_jerk_freq_mean_x", "acceleration_jerk_freq_mean_y", 
          "acceleration_jerk_freq_mean_z",
          "gyroscope_freq_mean_x", "gyroscope_freq_mean_y", "gyroscope_freq_mean_z",
          "acceleration_jerk_magnitude_freq_mean_x", 
          "acceleration_jerk_magnitude_freq_mean_y", 
          "acceleration_jerk_magnitude_freq_mean_z",
          "acceleration_time_std_x", "acceleration_time_std_y", 
          "acceleration_time_std_z",     
          "gravity_acceleration_time_std_x", "gravity_acceleration_time_std_y", 
          "gravity_acceleration_time_std_z",
          "acceleration_jerk_time_std_x", "acceleration_jerk_time_std_y", 
          "acceleration_jerk_time_std_z",
          "gyroscope_time_std_x", "gyroscope_time_std_y", "gyroscope_time_std_z",
          "gyroscope_jerk_time_std_x", 
          "gyroscope_jerk_time_std_y", "gyroscope_jerk_time_std_z",
          "acceleration_magnitude_time_std_x", "acceleration_magnitude_time_std_y", 
          "acceleration_magnitude_time_std_z",
          "acceleration_freq_std_x", "acceleration_freq_std_y", 
          "acceleration_freq_std_z",
          "acceleration_jerk_freq_std_x", "acceleration_jerk_freq_std_y", 
          "acceleration_jerk_freq_std_z",
          "gyroscope_freq_std_x", "gyroscope_freq_std_y", "gyroscope_freq_std_z",
          "acceleration_jerk_magnitude_freq_std_x", 
          "acceleration_jerk_magnitude_freq_std_y", 
          "acceleration_jerk_magnitude_freq_std_z", 
          "gyroscope_magnitude_time_std_x", "gyroscope_magnitude_time_std_y", 
          "gyroscope_magnitude_time_std_z","subject", "activity")

dataset <- relocate(dataset, activity, .before = acceleration_time_mean_x) ##move activity column
dataset <- relocate(dataset, subject, .before = activity)  ##move subject column
dataset$subject <- as.factor(dataset$subject) ##convert subject to factors
dataset$activity <- as.factor(dataset$activity) ##convert activity to factors
View(dataset)

#-------------------------------------------------------------------------------
#This section creates a new table with only the average of each variable for 
#each activity and each subject:
datasetavg <- (dataset %>%
      group_by(subject, activity) %>%
      summarize(across(acceleration_time_mean_x:gyroscope_magnitude_time_std_z, mean)))
View(datasetavg)
