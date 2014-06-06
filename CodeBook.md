=====================================================
Contents

=====================================================

1. Introduction
2. The dataset includes the following files:
3. Important points about the Data
4. Feature Selection
5. Feature Selection  - the mean and standard deviations
6. R Script





=====================================================
Introduction

=====================================================

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data we are interested in processing are data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


====================================================
The dataset includes the following files:

====================================================

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


===================================================
Important points about the Data

===================================================

Both the X_train.txt and X_test.txt contains the measurement results of the study. The file has 561 columns which describes, the measurement feature variables seen in the "Feature Selection" section of the code book.

The X_test.txt is made up of 9 volunteers (Volunteers: 2, 4, 9, 10, 12, 13, 18, 20, 24)

The X_train.txt is made up of 21 volunteers (Volunteers: 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30)


===================================================
Feature Selection

===================================================	

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:, 
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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


===================================================
Feature Selection  - the mean and standard deviations

===================================================

As we are only interested in data that describes the mean and standard variation of the data, the follwing features that contain keywords matching mean and std (standard deviation) are explicitly extracted from the total features:

"Subject"			"Activity"			"tbodyacc.meanx"
"tbodyacc.meany"		"tbodyacc.meanz"		"tbodyacc.stdx"
"tbodyacc.stdy"			"tbodyacc.stdz"			"tgravityacc.meanx"
"tgravityacc.meany"		"tgravityacc.meanz"		"tgravityacc.stdx"
"tgravityacc.stdy"		"tgravityacc.stdz"		"tbodyaccjerk.meanx"
"tbodyaccjerk.meany"		"tbodyaccjerk.meanz"		"tbodyaccjerk.stdx"
"tbodyaccjerk.stdy"		"tbodyaccjerk.stdz"		"tbodygyro.meanx"
"tbodygyro.meany"		"tbodygyro.meanz"		"tbodygyro.stdx"
"tbodygyro.stdy"		"tbodygyro.stdz"		"tbodygyrojerk.meanx"
"tbodygyrojerk.meany"		"tbodygyrojerk.meanz"		"tbodygyrojerk.stdx"
"tbodygyrojerk.stdy"		"tbodygyrojerk.stdz"		"tbodyaccmag.mean"
"tbodyaccmag.std"		"tgravityaccmag.mean"		"tgravityaccmag.std"
"tbodyaccjerkmag.mean"		"tbodyaccjerkmag.std"		"tbodygyromag.mean"
"tbodygyromag.std"		"tbodygyrojerkmag.mean"		"tbodygyrojerkmag.std"
"fbodyacc.meanx"		"fbodyacc.meany"		"fbodyacc.meanz"
"fbodyacc.stdx"			"fbodyacc.stdy"			"fbodyacc.stdz"
"fbodyacc.meanfreqx"		"fbodyacc.meanfreqy"		"fbodyacc.meanfreqz"
"fbodyaccjerk.meanx"		"fbodyaccjerk.meany"		"fbodyaccjerk.meanz"
"fbodyaccjerk.stdx"		"fbodyaccjerk.stdy"		"fbodyaccjerk.stdz"
"fbodyaccjerk.meanfreqx"	"fbodyaccjerk.meanfreqy		"fbodyaccjerk.meanfreqz"
"fbodygyro.meanx"		"fbodygyro.meany"		"fbodygyro.meanz"
"fbodygyro.stdx"		"fbodygyro.stdy"		"fbodygyro.stdz"
"fbodygyro.meanfreqx"		"fbodygyro.meanfreqy"		"fbodygyro.meanfreqz"
"fbodyaccmag.mean"		"fbodyaccmag.std"		"fbodyaccmag.meanfreq"
"fbodybodyaccjerkmag.mean"	"fbodybodyaccjerkmag.std"	"fbodybodyaccjerkmag.meanfreq"
"fbodybodygyromag.mean"		"fbodybodygyromag.std"		"fbodybodygyromag.meanfreq"
"fbodybodygyrojerkmag.mean"	"fbodybodygyrojerkmag.std"	"fbodybodygyrojerkmag.meanfreq

Every volunteer is given a number representation (from 1 to 30) and the volunteer is decribed in the "Subject" feature above.

"Activity" refers to one of the activities performed by the voluteers (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The remaining are the measurement features.


===================================================
R Script

===================================================

The data cleaning and processing of the measurements are done in R Language. The steps and script are as follows.

Step 1: Download and extract all data files into working folder. Ensure the files are extracted according to its folder structure

Step 2: Read

Step 2: Open RStudio

Step 3: Set working directory as the folder the data files are extracted

Step 4: Run R script



#----------- Define the locations of the files used in the data cleaning ------

XTrain.data.Loc <- "./train/X_train.txt"  #file location of train data
XTest.data.Loc <- "./test/X_test.txt"     #file location of test data
XTrain.Activitylabel.Loc <- "./train/y_train.txt"    #file location of activity label of train data
XTest.Activitylabel.Loc <- "./test/y_test.txt"     #file location of activity label of test data
XTrain.Subjectlabel.Loc <- "./train/subject_train.txt"    #file location of subject label of train data
XTest.Subjectlabel.Loc <- "./test/subject_test.txt"    #file location of subject label of test data
ActivityLabels.Loc <- "activity_labels.txt"    #file location of activity labels
features.Loc <- "features.txt"    #file location of features

#-----------------------------------------------------------------------------



#---------- Read the various files into a data frame -------------------------

features <- read.table(features.Loc)  #read features into "features" data frame
ActivityLabels <- read.table(ActivityLabels.Loc)   #read activity labels to "ActivityLabels" data frame

XTrain.data <- read.table(XTrain.data.Loc)    #read training data to "XTrain.data" data frame
XTrain.Activitylabel <- read.table(XTrain.Activitylabel.Loc)   #read activity label of training data to "XTrain.Activitylabel" data frame
XTrain.Subjectlabel <- read.table(XTrain.Subjectlabel.Loc)   #read subject label of training data to "XTrain.Subjectlabel" data frame

XTest.data <- read.table(XTest.data.Loc)    #read testing data to "XTest.data" data frame
XTest.Activitylabel <- read.table(XTest.Activitylabel.Loc)    #read activity label of testing data to "XTest.Activitylabel" data frame
XTest.Subjectlabel <- read.table(XTest.Subjectlabel.Loc)     #read subject label of testing data to "XTest.Subjectlabel" data frame

#-------------------------------------------------------------------------------



#---------- Cleaning of Data ---------------------------------------------------

meanstd.feature <- features[grep("mean|std",features$V2),]  #features that are related to mean and std; "mean|std" interprets as "mean OR std"

XTrain.Data.meanstd <- XTrain.data[,meanstd.feature$V1]   #extract columns in training data that are mean and std related; call this new extracted data as "XTrain.Data.meanstd"
XTest.Data.meanstd <- XTest.data[,meanstd.feature$V1]    #extract columns in testing data that are mean and std related; ; call this new extracted data as "XTest.Data.meanstd"

XTrain.Data.meanstd <- cbind(XTrain.Subjectlabel,XTrain.Activitylabel,XTrain.Data.meanstd)  #combine Subject and Activity information to mean or std related training data
XTest.Data.meanstd <- cbind(XTest.Subjectlabel,XTest.Activitylabel,XTest.Data.meanstd)   #combine Subject and Activity information to mean or std related testing data

names(XTrain.Data.meanstd) <- c("Subject","Activity",as.character(meanstd.feature$V2))  #rename XTrain.Data.meanstd
names(XTest.Data.meanstd) <- c("Subject","Activity",as.character(meanstd.feature$V2))   #rename XTest.Data.meanstd
XTrain.Data.meanstd$Activity <- factor(XTrain.Data.meanstd$Activity,levels=c(1:6), labels=ActivityLabels$V2)   #change the activity labels to a more descriptive label 
XTest.Data.meanstd$Activity <- factor(XTest.Data.meanstd$Activity,levels=c(1:6), labels=ActivityLabels$V2)     #change the activity labels to a more descriptive label

xdata <- rbind(XTrain.Data.meanstd,XTest.Data.meanstd)    #merge the testing and training data into a single dataframe called "xdata"

#-------------------------------------------------------------------------------



#----------- simplifying column names ------------------------------------------

normNames <- names(xdata)   #retrieve the column names of "xdata"

for(i in 3:length(normNames)) {     #looking at columns excluding "Subject" and "Activity"
        #normNames[i] <- substr(normNames[i],2,nchar(normNames[i]))    #remove first character of name
        normNames[i] <- gsub("-","",normNames[i])      #remove all "-"
        normNames[i] <- gsub("\\()","",normNames[i])   #remove all "()"
        normNames[i] <- gsub("mean",".mean",normNames[i])  #change all "mean" to ".mean"
        normNames[i] <- gsub("std",".std",normNames[i])    #change all "std" to ".std"
        normNames[i] <- tolower(normNames[i])      #change all columns to lowercaps
}

names(xdata) <- normNames    #change the column names of xdata
#------------------------------------------------------------------------------


#----------- Summarize the average of the tidy data by the Subject and Activity ---------

library(reshape2)   #load the "reshape2" library

xdata.melt <- melt(xdata,id.vars=normNames[1:2])    #melt data with Subject and Activity as id and the rest as measured variable
xdata.summary <- dcast(xdata.melt, Subject+Activity ~ variable, mean)   #dcast data using Subject and Activity as the response; variable as the predictor

#-----------------------------------------------------------------------------------------
        
        
head(xdata.summary)   #shows the head of the cleaned data

