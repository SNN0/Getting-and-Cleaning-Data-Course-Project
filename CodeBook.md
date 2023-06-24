# Code Book
This code book describes the variables, the data, and any transformations or work performed to clean up to data.

# Data Source
The data used in this project is sourced from the Human Activity Recognititon Using Smartphones Dataset. The dataset captures accelerometer and gyroscope data from the Samsung Galaxy S smartphone. The data represents a group of 30 volunteers performing various activities while wearing the smartphone.

# Variables
The variables in the dataset inculude:
#### 1. Subject: An identifier for the volunteer who performed the activity.
#### 2. Activity: The type of activity performed by the volunteer (e.g., Walking, Sitting, Laying).
#### 3. Measurement variables: These variables represent the mean and standard deviation of various accelerometer and gyroscope measurements. The names of these variables follow the pattern "mean()" and "std()" respectively, as described in the feature selection section of the dataset.

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

# Data Transformation
The following steps were performed to clean and transform the data:

1. Training and test sets were merged to create one dataset.
2. Only the measurement variables related to mean and standard deviation were extracted.
3. Descriptive activity names were used to label the activities in the dataset.
4. Appropriate variable names were assigned to the dataset to make them more descriptive.
5. A second, independent tidy dataset was created, which represents the average of each variable for each activity and each subject.

# Tidy Data
The final tidy dataset, named "tidyData.txt", contains the average values of the selected measurement variables for each activity and each subject.
