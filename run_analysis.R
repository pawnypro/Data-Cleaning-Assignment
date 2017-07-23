# Working directory must be set to "UCI HAR Dataset" folder.
# Read the subject, activity and features data of the training dataset from the raw datasets
SubjectTrain <- read.table("train/subject_train.txt", fill = TRUE, header= FALSE)
YTrain <- read.table("train/y_train.txt", fill = TRUE, header= FALSE)
XTrain <- read.table("train/X_train.txt", fill = TRUE, header= FALSE)
# Club the subject, activity and features together to form one Training dataframe
Train_DF <- data.frame(SubjectTrain[,1],YTrain[,1],XTrain)

# Read the subject, activity and features data of the testing dataset from the raw datasets
SubjectTest <- read.table("test/subject_test.txt", fill = TRUE, header= FALSE)
YTest <- read.table("test/y_test.txt", fill = TRUE, header= FALSE)
XTest <- read.table("test/X_test.txt", fill = TRUE, header= FALSE)
# Club the subject, activity and features together to form one Training dataframe
Test_DF <- data.frame(SubjectTest[,1],YTest[,1],XTest)

# In order to name the variables of the training and testing dataframes created above, we read the list of features from 
# features.txt file
Features_DF <- read.table("features.txt", fill = TRUE, header= FALSE)

# Create a name vector for all the variable names in the traning and testing dataframes, and then assign the names.
NamesVector1 <- c("SubjectID", "ActivityLabel", as.character(Features_DF[, 2]))
names(Train_DF) <- NamesVector1
names(Test_DF) <- NamesVector1

# Combine the training and testing dataframes together to form one complete dataframe, containing the SubjectID,
# the ActivityLabel and the 561 features for each observation.
Total_Features_DF <- rbind(Train_DF, Test_DF)
# Order this dataframe by SubjectID
Total_Features_DF <- Total_Features_DF[order(Total_Features_DF$SubjectID), ]

# Load the matrixStats library to be able to use the rowSds function for calculating standard deviations of rows.
library(matrixStats)

# Read the accelerometer and gyroscope readings across the x, y and z axes from the training data
total_acc_x_train <- read.table("train/Inertial Signals/total_acc_x_train.txt", header = FALSE)
total_acc_y_train <- read.table("train/Inertial Signals/total_acc_y_train.txt", header = FALSE)
total_acc_z_train <- read.table("train/Inertial Signals/total_acc_z_train.txt", header = FALSE)

body_acc_x_train <- read.table("train/Inertial Signals/body_acc_x_train.txt", header = FALSE)
body_acc_y_train <- read.table("train/Inertial Signals/body_acc_y_train.txt", header = FALSE)
body_acc_z_train <- read.table("train/Inertial Signals/body_acc_z_train.txt", header = FALSE)

body_gyro_x_train <- read.table("train/Inertial Signals/body_gyro_x_train.txt", header = FALSE)
body_gyro_y_train <- read.table("train/Inertial Signals/body_gyro_y_train.txt", header = FALSE)
body_gyro_z_train <- read.table("train/Inertial Signals/body_gyro_z_train.txt", header = FALSE)

# Means and Standard Deviations of the accelerometer	and gyroscope readings (128 readings/window) are calculated,
# and matched with the corresponding Subject to form a training measurements dataframe
Train_Measurements_DF <- data.frame(SubjectTrain[, 1], rowMeans(total_acc_x_train), rowSds(as.matrix(total_acc_x_train)), 
rowMeans(total_acc_y_train), rowSds(as.matrix(total_acc_y_train)),
rowMeans(total_acc_z_train), rowSds(as.matrix(total_acc_z_train)),
rowMeans(body_acc_x_train), rowSds(as.matrix(body_acc_x_train)),
rowMeans(body_acc_y_train), rowSds(as.matrix(body_acc_y_train)),
rowMeans(body_acc_z_train), rowSds(as.matrix(body_acc_z_train)),
rowMeans(body_gyro_x_train), rowSds(as.matrix(body_gyro_x_train)),
rowMeans(body_gyro_y_train), rowSds(as.matrix(body_gyro_y_train)),
rowMeans(body_gyro_z_train), rowSds(as.matrix(body_gyro_z_train)))

# Read the accelerometer and gyroscope readings across the x, y and z axes from the testing data
total_acc_x_test <- read.table("test/Inertial Signals/total_acc_x_test.txt", header = FALSE)
total_acc_y_test <- read.table("test/Inertial Signals/total_acc_y_test.txt", header = FALSE)
total_acc_z_test <- read.table("test/Inertial Signals/total_acc_z_test.txt", header = FALSE)

body_acc_x_test <- read.table("test/Inertial Signals/body_acc_x_test.txt", header = FALSE)
body_acc_y_test <- read.table("test/Inertial Signals/body_acc_y_test.txt", header = FALSE)
body_acc_z_test <- read.table("test/Inertial Signals/body_acc_z_test.txt", header = FALSE)

body_gyro_x_test <- read.table("test/Inertial Signals/body_gyro_x_test.txt", header = FALSE)
body_gyro_y_test <- read.table("test/Inertial Signals/body_gyro_y_test.txt", header = FALSE)
body_gyro_z_test <- read.table("test/Inertial Signals/body_gyro_z_test.txt", header = FALSE)

# Means and Standard Deviations of the accelerometer	and gyroscope readings (128 readings/window) are calculated,
# and matched with the corresponding Subject to form a testing measurements dataframe
Test_Measurements_DF <- data.frame(SubjectTest[, 1], rowMeans(total_acc_x_test), rowSds(as.matrix(total_acc_x_test)), 
rowMeans(total_acc_y_test), rowSds(as.matrix(total_acc_y_test)),
rowMeans(total_acc_z_test), rowSds(as.matrix(total_acc_z_test)),
rowMeans(body_acc_x_test), rowSds(as.matrix(body_acc_x_test)),
rowMeans(body_acc_y_test), rowSds(as.matrix(body_acc_y_test)),
rowMeans(body_acc_z_test), rowSds(as.matrix(body_acc_z_test)),
rowMeans(body_gyro_x_test), rowSds(as.matrix(body_gyro_x_test)),
rowMeans(body_gyro_y_test), rowSds(as.matrix(body_gyro_y_test)),
rowMeans(body_gyro_z_test), rowSds(as.matrix(body_gyro_z_test)))

# Create a names vector to assign appropriate names to the variables of the training and testing 
# measurements dataframe
NamesVector2 <- c("SubjectID", "Mean_total_acc_x", "SD_total_acc_x", 
"Mean_total_acc_y", "SD_total_acc_y",
"Mean_total_acc_z", "SD_total_acc_z",
"Mean_body_acc_x", "SD_body_acc_x",
"Mean_body_acc_y", "SD_body_acc_y",
"Mean_body_acc_z", "SD_body_acc_z",
"Mean_body_gyro_x", "SD_body_gyro_x",
"Mean_body_gyro_y", "SD_body_gyro_y",
"Mean_body_gyro_z", "SD_body_gyro_z")

# Assign the names to the training and testing dataframes
names(Test_Measurements_DF) <- NamesVector2
names(Train_Measurements_DF) <- NamesVector2

# Combine the training and testing measurements dataframes to form a new dataframe with measurement 
# values of both the training and testing subjects
Total_Measurements_DF <- rbind(Train_Measurements_DF, Test_Measurements_DF)
# Order this dataframe also by SubjectID
Total_Measurements_DF <- Total_Measurements_DF[order(Total_Measurements_DF$SubjectID), ]

# Now we have 2 dataframes:
# 1> Total_Features_DF - comprising of all 561 features for observations of all subjects across all activities (total 563 columns)
# 2> Total_Measurements_DF - comprising of the means and standard deviations of accelerometer and gyroscope readings for each subject (total 19 variables)
# Both dataframes are ordered by SubjectID, so we simply column bind the measurements to the features to form the Final DF
# Combining the 2 dataframes to get our final dataframe which shall be used for summarizing by SubjectID and ActivityLabel later.
# FinalDF is going to have 1 + 1 + 561 + 18 = 581 columns (SubjectID + ActivityLabel + 561 Features + 18 Measurements)
FinalDF <- cbind(Total_Features_DF, Total_Measurements_DF[, -1])
# We order the FinalDF first by SubjectID and then by ActivityLabel
FinalDF <- FinalDF[order(FinalDF$SubjectID, FinalDF$ActivityLabel), ]

# Summarizing the FinalDF to get the average of all variables for each subject doing every activity
# Loop through the SubjectIDs (1 to 30 subjects) and then for each subject we loop through the activities (1 - WALKING, 2 - WALKING_UPSTAIRS,
# 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING), and find the average of all the variables in the FinalDF (column 3 to 581)
# a new dataframe newDF is created
newDF <- data.frame()
L1 <- split(FinalDF, FinalDF$SubjectID)
i <- as.integer()
for (i in 1:length(L1))
  {
      L2 <- split(L1[[i]], L1[[i]]$ActivityLabel)
      j <- as.integer()
      for (j in 1:length(L2))
        {
            mn <- colMeans(L2[[j]]) #mn in numeric
            newDF <- rbind(newDF, mn)
        }
      
  }

# newDF is appropriately named
names(newDF) <- c(NamesVector1, NamesVector2[-1])

# Descriptive activity names are given to the codes as described in activity_labels.txt
FinalDF$ActivityLabel <- as.character(FinalDF$ActivityLabel)
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "1"] <- "WALKING"
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "2"] <- "WALKING_UPSTAIRS"
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "3"] <- "WALKING_DOWNSTAIRS"
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "4"] <- "SITTING"
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "5"] <- "STANDING"
FinalDF$ActivityLabel[FinalDF$ActivityLabel == "6"] <- "LAYING"


newDF$ActivityLabel <- as.character(newDF$ActivityLabel)
newDF$ActivityLabel[newDF$ActivityLabel == "1"] <- "WALKING"
newDF$ActivityLabel[newDF$ActivityLabel == "2"] <- "WALKING_UPSTAIRS"
newDF$ActivityLabel[newDF$ActivityLabel == "3"] <- "WALKING_DOWNSTAIRS"
newDF$ActivityLabel[newDF$ActivityLabel == "4"] <- "SITTING"
newDF$ActivityLabel[newDF$ActivityLabel == "5"] <- "STANDING"
newDF$ActivityLabel[newDF$ActivityLabel == "6"] <- "LAYING"

newDF$SubjectID <- as.factor(as.character(newDF$SubjectID))
newDF$ActivityLabel <- as.factor(newDF$ActivityLabel)

# We write out the new tidy dataset
#write.csv(FinalDF, "FinalDF.csv")
#write.csv(newDF, "newDF.csv")
write.table(newDF, "newDF.txt", row.names = FALSE)