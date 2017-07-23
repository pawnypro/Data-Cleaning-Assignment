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
