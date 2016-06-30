# CodeBook

All data in tidy.txt file is an average of each variable for each activity and each subject.  
  
##### Measurement's Identifiers
**subject** - Identifies the subject who performed the activity. Its range is from 1 to 30.  
**activity** - The activity that was performed. Has 6 possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.    
  
##### Features
*For each feature there are an average value (variable name contains "mean()") and a standard deviation value (variable name contains "std()")*  
**tBodyAcc** - Time domain body acceleration signal from the accelerometer. Units: 'g'. Includes 3 variables, one for each axis (X, Y, Z).  
**tGravityAcc** - Time domain gravity acceleration signal from the accelerometer. Units: 'g'. Includes 3 variables, one for each axis (X, Y, Z).  
**tBodyAccJerk** - Time domain Jerk signal of body acceleration. Includes 3 variables, one for each axis (X, Y, Z).  
**tBodyGyro** - Time domain body angular velocity signal from the gyroscope. Includes 3 variables, one for each axis (X, Y, Z).  
**tBodyGyroJerk** - Time domain Jerk signal of body angular velocity. Includes 3 variables, one for each axis (X, Y, Z).  
**tBodyAccMag** - The magnitude of the time domain body acceleration signal.  
**tGravityAccMag** - The magnitude of the time domain gravity acceleration signal.  
**tBodyAccJerkMag** - The magnitude of the time domain Jerk signal of body acceleration.  
**tBodyGyroMag** - The magnitude of the time domain body angular velocity signal from the gyroscope.   
**tBodyGyroJerkMag** - The magnitude of the time domain Jerk signal of body angular velocity.   
**fBodyAcc** - Frequency domain body acceleration signal from the accelerometer. Includes 3 variables, one for each axis (X, Y, Z).  
**fBodyAccJerk** - Frequncy domain Jerk signal of body acceleration. Includes 3 variables, one for each axis (X, Y, Z).  
**fBodyGyro** - Frequency domain body angular velocity signal from the gyroscope. Includes 3 variables, one for each axis (X, Y, Z).  
**fBodyAccMag** - The magnitude of the frequency domain body acceleration signal.  
**fBodyBodyAccJerkMag** - The magnitude of the frequency domain Jerk signal of body acceleration.  
**fBodyBodyGyroMag** - The magnitude of the frequency domain body angular velocity signal from the gyroscope.   
**fBodyBodyGyroJerkMag** - The magnitude of the frequency domain Jerk signal of body angular velocity.   
