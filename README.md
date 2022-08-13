# Run_Analysis_UCI_HAR_avgs
Create table of selected feature averages grouped by subject and activity from the UCI HAR dataset (Human Activity Recognition Using Smartphones Dataset).

For detailed information on the original datset, see the text from the UCI HAR README file that is copied at the bottom of this file.
  
The UCI HAR dataset contains raw data collected from 30 volunteers, aged 19-48, who engaged in daily-type activities while wearing a Samsung Galaxy S II smartphone on the waist. Data captured include proxy measures of body acceleration and velocity during walking, walking upstairs, walking downstairs, sitting, standing, and lying down. Video recordings allowed investigators to match activity-type to the readings.

The UCI HAR experiment offers features readings separated into two groups: a subset of volunteer data used as training data (70%) and a smaller subset used for testing data (30%). This code brings those 2 datasets together into one table.

The original dataset includes readings for 161 "feature" variables plus variables for subject id, activity id, activity labels, and variable labels. Of note is that this analysis code pares down the 161 original "features" variables to only the 66 that give information on mean and standard deviation measures, while binding the subject, activity labels, and adapted variable names to the full dataset of train and test data. The full dataset set created by this code includes 10,299 observations, which are pared down to 180 means-observations of those observations, grouped by subject and activity. The final table includes 180 summarized observations for 66 mean- or standard-deviation- "features" variables.

Users will need to download the original UCI HAR files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code included in run_analysis.r:
  1) Merges the train and test datasets available from data collected from the smartphone
  2) Selects out the 66 "features" variables that provide mean and standard-deviation readings
  3) Applies descriptive names to the 66 variables
  4) Column-binds the subject and activity variables to the merged datasets
  5) Groups the observations by subject and activity, then summarizes the data into average readings of the selected features variables.

From dowload to final output, this process requires 6 active steps:

Step 1: Download project files from: 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Step 2: Place unzipped project files in desired local directory

Step 3: To prevent the user from having to change directories, the user should copy and paste the following files from the downloaded UCI HAR subfolders into the main UCI HAR Dataset folder:
    From "test": subject_test.txt, X_test.txt, y_test.txt
    From "train": subject_train.txt, X_train.txt, y_train.txt
              
Step 4: Set the working directory in RStudio

Step 5: If the user has not installed the r package 'tidyverse', it can be installed in RStudio by entering install.packages("tidyverse") into the command line of their RStudio console and hitting return. The analysis code will open this package for the user.

Step 6: Paste all the code from run_analysis.r into the RStudio console and hit return. This can be done by using select all (within source) -> copy (within source) ->, paste (within console).
Note: 2 tables will appear in 'source' after code has run: 
    "dataset" (full dataset of means & std's before summarizing) and 
    "datasetavg" (average of each variable for each activity and each subject)
    
For detailed explanation of what each line of code achieves, see the line-by-line notes in run_analysis.r.


Below is the unaltered UCI HAR README text, including reference:

"==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012."
