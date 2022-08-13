CodeBook
================
Cortney McLellan
2022-08-13

## Data Overview

The UCI HAR dataset contains raw data collected from 30 volunteers, aged
19-48, who engaged in daily-type activities while wearing a Samsung
Galaxy S II smartphone on the waist. The smartphone contains an
accelerometer and gyroscope, from which readings were taken. Data
captured include proxy measures of body linear acceleration and angular
velocity during walking, walking upstairs, walking downstairs, sitting,
standing, and lying down. Video recordings allowed investigators to
match activity-type to the readings.

The UCI HAR experiment offers features readings separated into two
groups: a subset of volunteer data used as training data (70%) and a
smaller subset used for testing data (30%). This code brings those 2
datasets together into one table.

The original dataset includes readings for 161 “feature” variables plus
variables for subject id, activity id, activity labels, and variable
labels. Of note is that this analysis code pares down the 161 original
“features” variables to only the 66 that give information on mean and
standard deviation measures, while binding the subject, activity labels,
and adapted variable names to the full dataset of train and test data.
The full dataset set created by this code includes 10,299 observations,
which are pared down to 180 means-observations of those observations,
grouped by subject and activity. The final table includes 180 summarized
observations for 66 mean- or standard-deviation- “features” variables.

A detailed description of the study from the UCI HAR README file is
provided at the end of this document.

## Variables Used in this Code:

### General Labels:

**subject**: the id number for the relevant subject from whom data was
obtained.

**activity**: The type of activity the subject was engaged in during
measurement, as obtained by investigator review of recorded video of the
subject. Options include: walking, walking upstairs, walking downstairs,
sitting, standing, and lying.

### Feature Variables:

**acceleration** (given as time and frequency, the mean and std of x, y,
z): Body acceleration

**gravity_acceleration** (given as time, the mean and std of x, y, z):
Gravity acceleration

**acceleration_jerk** (given as time and frequency, the mean and std of
x, y, z): Body acceleration jerk

**gyroscope** (given as time and frequency, the mean and std of x, y,
z): Body gyroscope

**gyroscope_jerk** (given as time, the mean and std of x, y, z): Body
gyroscope jerk

**acceleration_magnitude** (given as time, the mean and std of x, y, z):
Body acceleration

**gyroscope_magnitude** (given as time, the mean and std of x, y, z):
Body gyroscope magnitude

**acceleration_jerk_magnitude** (given as frequency, the mean and std of
x, y, z): Body acceleration jerk magnitude

**gyroscope_magnitude** (given as time, the mean and std of x, y, z):
Body gyroscope magnitude

-   If the measure is one of time, \_time is included in the variable
    name.
-   If the measure is one of frequency, \_freq is included in the
    variable name.
-   If the summary measure used is mean value, \_mean is included in the
    variable name.
-   If the summary measure used is standard deviation, \_std is included
    in the variable name.
-   The axis is indicated by \_x, \_y, or \_z at the end of the variable
    name.
-   For example, “gyroscope_jerk_time_mean_x” is the mean time of the
    feature “body gyroscope” measured on the x-axis.

## User Steps for Getting and Preparing Data form the Study

### Step 1: Download project files from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### Step 2: Place unzipped project files in desired directory

### Step 3: To prevent you from having to change directories, copy and paste the following files from their subfolders into the main “UCI HAR Dataset” folder:

        from "test": subject_test.txt, X_test.txt, y_test.txt
        from "train": subject_train.txt, X_train.txt, y_train.txt

## RStudio Steps and Running the Code

with explanations of each coding step

### Step 4: Set your working directory

### Step 5: If you have not installed the r package ‘tidyverse’, do this now using: (install.packages(“tidyverse”))

### Step 6: Paste all the code in to console and hit return. You can do this by:

In source, select all then copy. In console, paste copied code. Note: 2
datasets will appear in ‘source’ after code has run: \#“dataset” (full
dataset of means & std’s before summarizing) and \#“datasetavg” (average
of each variable for each activity and each subject)

The following can be found in run_analysis.r

### This section brings the test dataset together:

library(tidyverse) *open tidyverse package*

set_test \<- read.table(“X_test.txt”) *get test raw test data*

var_names \<- read.table(“features.txt”) *get raw test data variable
names*

var_names \<- var_names\[,2\] *subset to column with variable names*

vec_1 \<- var_names *vectorize variable names*

colnames(set_test) \<- vec_1 *apply variable names to column names*

act_id_test \<- read.table(“y_test.txt”) *get test-activity ids*

colnames(act_id_test)\<- “activity_id” *assign name to variable*

activity_code \<- c(walking=1, walkingupstairs=2, walkingdownstairs=3,
sitting=4, standing=5, laying=6) *code to pair id w/activity*

act_id_test![activity \<- names(activity_code)\[match(act_id_test](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;activity%20%3C-%20names%28activity_code%29%5Bmatch%28act_id_test "activity <- names(activity_code)[match(act_id_test")activity,
activity_code)\] *change id to activity type*

activity_test \<- act_id_test *rename table for clarity*

set_test_act \<- cbind(activity_test$activity, set_test) *bind activity
to raw test data*

sub_id_test \<- read.table(“subject_test.txt”) *get test-subject ids*

colnames(sub_id_test) \<- “subject” *assign name to variable*

set_test_sub_act \<- cbind(sub_id_test, set_test_act) *bind subject ids
to raw test data*

dataset_test \<- set_test_sub_act *give test dataset more descriptive
name*

colnames(dataset_test)\[2\] \<- “activity” *fix activity variable name*

### This section brings the training dataset together:

set_train \<- read.table(“X_train.txt”) *get raw training data*

var_names \<- read.table(“features.txt”) *get raw training data variable
names*

var_names \<- var_names\[,2\] *subset to column with variable names*

vec_1 \<- var_names *vectorize variable names*

colnames(set_train) \<- vec_1 *apply variable names to column names*

act_id_train \<- read.table(“y_train.txt”) *get training-activity ids*

colnames(act_id_train)\<- “activity_id” *assign name to variable*

activity_code \<- c(walking=1, walkingupstairs=2,walkingdownstairs=3,
sitting=4, standing=5, laying=6) *code to pair id w/activity*

act_id_train![activity \<- names(activity_code)\[match(act_id_train](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;activity%20%3C-%20names%28activity_code%29%5Bmatch%28act_id_train "activity <- names(activity_code)[match(act_id_train")activity,
activity_code)\] *change id to activity type*

activity_train \<- act_id_train *rename table for clarity*

set_train_act \<- cbind(activity_train$activity, set_train ) *bind
activity to raw training data*

sub_id_train \<- read.table(“subject_train.txt”) *get training-subject
ids*

colnames(sub_id_train) \<- “subject” *assign name to variable*

set_train_sub_act \<- cbind(sub_id_train, set_train_act) *bind subject
ids to raw training data*

dataset_train \<- set_train_sub_act *give training dataset more
descriptive name*

colnames(dataset_train)\[2\] \<- “activity” *fix activity variable name*

### This section appends the training dataset to the test dataset:

dataset_full \<- rbind(dataset_train, dataset_test)

### This section selects only the mean and standard deviation variables from the dataset:

dataset \<- dataset_full %\>% select(contains(“mean()”) \|
contains(“std”) \| contains(“subject”) \| contains (“activity”))

### This section renames the variables in more descriptive ways and re-orders the \#columns.

There is probably a more elegant and efficient way to do this, but this
works anyway:

colnames(dataset) \<- c(“acceleration_time_mean_x”,
“acceleration_time_mean_y”, “acceleration_time_mean_z”,  
“gravity_acceleration_time_mean_x”, “gravity_acceleration_time_mean_y”,
“gravity_acceleration_time_mean_z”, “acceleration_jerk_time_mean_x”,
“acceleration_jerk_time_mean_y”, “acceleration_jerk_time_mean_z”,
“gyroscope_time_mean_x”, “gyroscope_time_mean_y”,
“gyroscope_time_mean_z”, “gyroscope_jerk_time_mean_x”,
“gyroscope_jerk_time_mean_y”, “gyroscope_jerk_time_mean_z”,
“acceleration_magnitude_time_mean_x”,
“acceleration_magnitude_time_mean_y”,
“acceleration_magnitude_time_mean_z”, “gyroscope_magnitude_time_mean_x”,
“gyroscope_magnitude_time_mean_y”, “gyroscope_magnitude_time_mean_z”,
“acceleration_freq_mean_x”, “acceleration_freq_mean_y”,
“acceleration_freq_mean_z”, “acceleration_jerk_freq_mean_x”,
“acceleration_jerk_freq_mean_y”, “acceleration_jerk_freq_mean_z”,
“gyroscope_freq_mean_x”, “gyroscope_freq_mean_y”,
“gyroscope_freq_mean_z”, “acceleration_jerk_magnitude_freq_mean_x”,
“acceleration_jerk_magnitude_freq_mean_y”,
“acceleration_jerk_magnitude_freq_mean_z”, “acceleration_time_std_x”,
“acceleration_time_std_y”, “acceleration_time_std_z”,  
“gravity_acceleration_time_std_x”, “gravity_acceleration_time_std_y”,
“gravity_acceleration_time_std_z”, “acceleration_jerk_time_std_x”,
“acceleration_jerk_time_std_y”, “acceleration_jerk_time_std_z”,
“gyroscope_time_std_x”, “gyroscope_time_std_y”, “gyroscope_time_std_z”,
“gyroscope_jerk_time_std_x”, “gyroscope_jerk_time_std_y”,
“gyroscope_jerk_time_std_z”, “acceleration_magnitude_time_std_x”,
“acceleration_magnitude_time_std_y”,
“acceleration_magnitude_time_std_z”, “acceleration_freq_std_x”,
“acceleration_freq_std_y”, “acceleration_freq_std_z”,
“acceleration_jerk_freq_std_x”, “acceleration_jerk_freq_std_y”,
“acceleration_jerk_freq_std_z”, “gyroscope_freq_std_x”,
“gyroscope_freq_std_y”, “gyroscope_freq_std_z”,
“acceleration_jerk_magnitude_freq_std_x”,
“acceleration_jerk_magnitude_freq_std_y”,
“acceleration_jerk_magnitude_freq_std_z”,
“gyroscope_magnitude_time_std_x”, “gyroscope_magnitude_time_std_y”,
“gyroscope_magnitude_time_std_z”,“subject”, “activity”)

dataset \<- relocate(dataset, activity, .before =
acceleration_time_mean_x) *move activity column*

dataset \<- relocate(dataset, subject, .before = activity) *move subject
column*

dataset![subject \<- as.factor(dataset](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;subject%20%3C-%20as.factor%28dataset "subject <- as.factor(dataset")subject)
*convert subject to factors*

dataset![activity \<- as.factor(dataset](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;activity%20%3C-%20as.factor%28dataset "activity <- as.factor(dataset")activity)
*convert activity to factors*

View(dataset)

### This section creates a new table with only the average of each variable for each activity and each subject:

datasetavg \<- (dataset %\>% group_by(subject, activity) %\>%
summarize(across(acceleration_time_mean_x:gyroscope_magnitude_time_std_z,
mean)))

View(datasetavg)

## UCI HAR README description:

From the UCI HAR README file: “Jorge L. Reyes-Ortiz, Davide Anguita,
Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems
Laboratory DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A,
I-16145, Genoa, Italy. <activityrecognition@smartlab.ws> www.smartlab.ws
==================================================================

“The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

“The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain….

“For each record it is provided: - Triaxial acceleration from the
accelerometer (total acceleration) and the estimated body
acceleration. - Triaxial Angular velocity from the gyroscope. - A
561-feature vector with time and frequency domain variables. - Its
activity label. - An identifier of the subject who carried out the
experiment.

“The dataset includes the following files: - ‘README.txt’ -
‘features_info.txt’: Shows information about the variables used on the
feature vector. - ‘features.txt’: List of all features. -
‘activity_labels.txt’: Links the class labels with their activity
name. - ‘train/X_train.txt’: Training set. - ‘train/y_train.txt’:
Training labels. - ‘test/X_test.txt’: Test set. - ‘test/y_test.txt’:
Test labels.

“The following files are available for the train and test data. Their
descriptions are equivalent. - ‘train/subject_train.txt’: Each row
identifies the subject who performed the activity for each window
sample. Its range is from 1 to 30. - ‘train/Inertial
Signals/total_acc_x\_train.txt’: The acceleration signal from the
smartphone accelerometer X axis in standard gravity units ‘g’. Every row
shows a 128 element vector. The same description applies for the
‘total_acc_x\_train.txt’ and ‘total_acc_z\_train.txt’ files for the Y
and Z axis. - ‘train/Inertial Signals/body_acc_x\_train.txt’: The body
acceleration signal obtained by subtracting the gravity from the total
acceleration. - ‘train/Inertial Signals/body_gyro_x\_train.txt’: The
angular velocity vector measured by the gyroscope for each window
sample. The units are radians/second.

“Notes: - Features are normalized and bounded within \[-1,1\]. - Each
feature vector is a row on the text file.

“For more information about this dataset contact:
<activityrecognition@smartlab.ws>

“License: Use of this dataset in publications must be acknowledged by
referencing the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

“This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.” (End of UCI_HAR README file)
