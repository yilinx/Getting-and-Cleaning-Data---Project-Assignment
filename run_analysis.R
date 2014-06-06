

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