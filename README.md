# Data-Cleaning-Assignment
## Details of the experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Available data

### Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*'train/Inertial Signals/total_acc_x_train.txt':* The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the *'total_acc_x_train.txt'* and *'total_acc_z_train.txt'* files for the Y and Z axis.

*'train/Inertial Signals/body_acc_x_train.txt':* The body acceleration signal obtained by subtracting the gravity from the total acceleration.

Similar files are available for test data.

### Triaxial Angular velocity from the gyroscope. 

*'train/Inertial Signals/body_gyro_x_train.txt':* The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. Similar files available for the other 2 axes.

### A 561-feature vector with time and frequency domain variables. 

*'train/X_train.txt':* Training set.

*'test/X_test.txt':* Test set.

### Its activity label. 

*'train/y_train.txt':* Training records

*'train/y_test.txt':* Training records

### An identifier of the subject who carried out the experiment.

*'train/subject_train.txt'*

## Analysis Done
Working directory must be set to "UCI HAR Dataset" folder.

### We merged the training and the test sets to create one data set.
We read the subject, activity and features data of the training and test datasets from the raw files listed above and then club the subject, activity and features together to form Training and test dataframes.
Variables are appropriately named and the training and testing dataframes are combined together to form one complete dataframe, containing the SubjectID, the ActivityLabel and the 561 features for each observation.
We order this dataframe by SubjectID

### Extracts only the measurements on the mean and standard deviation for each measurement.
We read the accelerometer and gyroscope readings across the x, y and z axes from the training and test datasets. Means and Standard Deviations of the accelerometer	and gyroscope readings (128 readings/window) are calculated and matched with the corresponding Subject to form a training and test measurements dataframes.
The dataframes are appropriately named and combined together to form a new dataframe with measurement values of both the training and testing subjects.
We order this dataframe by SubjectID

Now we have 2 dataframes:
1> Total_Features_DF - comprising of all 561 features for observations of all subjects across all activities (total 563 columns: 1 + 1 + 561)
2> Total_Measurements_DF - comprising of the means and standard deviations of accelerometer and gyroscope readings for each subject (total 19 variables)
Both dataframes are ordered by SubjectID, so we simply column bind the measurements to the features to form the Final DF
Combining the 2 dataframes to get our final dataframe which shall be used for summarizing by SubjectID and ActivityLabel later.
FinalDF is going to have 1 + 1 + 561 + 18 = 581 columns (SubjectID + ActivityLabel + 561 Features + 18 Measurements)
We order the FinalDF first by SubjectID and then by ActivityLabel


### Appropriately labels the data set with descriptive variable names.
We name the feature variables from the list available in features.txt file, and use appropriate names for the measurement variables.

### Uses descriptive activity names to name the activities in the data set
We get the activity names from activity_labels.txt

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
We loop through the SubjectIDs (1 to 30 subjects) in FinalDF and then for each subject we loop through the activities (1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING), and find the average of all the variables in the FinalDF (column 3 to 581)
A new dataframe newDF is created to hold this data.

We then write the output to a .txt file.











