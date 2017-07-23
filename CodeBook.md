# CodeBook

* The output tidy data set contains 180 observations of 581 variables
 
## Description of the variables:
* Variable 1 is SubjectID - Each row identifies the subject who performed the activity.

* Variable 2 is ActivityLabel - Each row identifies the activity being done with descriptive activity names as specified in the “activity_labels.txt” file (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

* Variable 3 to Variable 563 represent the means of each of the 561 features explained in “features_info.txt”, for the SubjectID and ActivityLabel present in Variable 1 and Variable 2 respectively. Names of these variables are picked up from “features.txt” file.

* Variable 564 to 581:
Means and Standard Deviations of the accelerometer	and gyroscope readings (128 readings/window) were calculated. The readings along the X, Y and Z axes were picked up from the files available in “train/Inertial Signals/” folder. Variables are named as under:

 *"Mean_total_acc_x"*
 
 *"SD_total_acc_x"*
 
 *"Mean_total_acc_y"*
 
 *"SD_total_acc_y"*
 
 *"Mean_total_acc_z"*
 
 *"SD_total_acc_z"*
 
 *"Mean_body_acc_x"*
 
 *"SD_body_acc_x"*
 
 *"Mean_body_acc_y"*
 
 *"SD_body_acc_y"*
 
 *"Mean_body_acc_z"*
 
 *"SD_body_acc_z"*
 
 *"Mean_body_gyro_x"*
 
 *"SD_body_gyro_x"*
 
 *"Mean_body_gyro_y"*
 
 *"SD_body_gyro_y"*
 
 *"Mean_body_gyro_z"*
 
 *"SD_body_gyro_z"*

* Mean_total_acc_x - mean of the acceleration readings from the smartphone accelerometer X axis in standard gravity units 'g'
* SD_total_acc_x - standard deviation of the acceleration readings from the smartphone accelerometer X axis in standard gravity units 'g'
* Mean_body_acc_x - mean of the body acceleration readings obtained by subtracting the gravity from the total acceleration. 
* SD_body_acc_x - standard deviation of the body acceleration readings obtained by subtracting the gravity from the total acceleration. 
* Mean_body_gyro_x - mean of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
* SD_body_gyro_x - standard deviation of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Similar descriptions apply for the y and z axis as well.
Each row corresponds to the averages off all these measurements for each activity and each subject.

 

 
