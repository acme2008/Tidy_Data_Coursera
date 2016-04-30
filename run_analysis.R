## Create one R script called run_analysis.R that does the following: 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load the necessary packages

if (!require("data.table")) { 
        install.packages("data.table") 
        } 
if (!require("dplyr")) { 
        install.packages("dplyr") 
} 

require("data.table")
require("dplyr")

## Load the associated data sets

features <- read.table(file = "features.txt")
activity_labels <- read.table(file = "activity_labels.txt",header = FALSE)

train_subject <- read.table(file = "train/subject_train.txt",header = FALSE)
train_y <- read.table(file = "train/y_train.txt",header = FALSE)
train_x <- read.table(file = "train/X_train.txt",header = FALSE)

test_subject <- read.table(file = "test/subject_test.txt",header = FALSE)
test_y <- read.table(file = "test/y_test.txt",header = FALSE)
test_x <- read.table(file = "test/X_test.txt",header = FALSE)

## Merge the Training and Testing Data Set 
Subject <- rbind(train_subject,test_subject)
Activity <- rbind(train_y,test_y)
Features <- rbind(train_x,test_x)

## Extracts only the measurements on the mean and standard deviation for each measurement
extract_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
Features <- Features[,extract_features]
names(Features) <- features[extract_features, 2]
names(Features) <- gsub("\\(|\\)", "", names(Features))
names(Features) <- tolower(names(Features))

## Uses descriptive activity names to name the activities in the data set
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
Activity[,1] = activity_labels[Activity[,1],2]
names(Activity) <- "activity"

# Appropriately labels the data set with descriptive variable names
names(Subject) <- "subject"
final <- cbind(Subject,Activity,Features)
write.table(final,"final_data.txt")

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
uniquesubject = unique(Subject)[,1] 
numsubject = length(unique(Subject)[,1]) 
numActivity = length(Activity[,1]) 
numCols = dim(final)[2] 
Tidy_Data = final[1:(numsubject*numActivity), ] 
row = 1 
for (s in 1:numsubject) { 
        for (a in 1:numActivity) { 
                Tidy_Data[row, 1] = uniquesubject[s] 
                Tidy_Data[row, 2] = Activity[a, 2] 
                x <- final[final$subject==s & final$activity==Activity[a, 2], ] 
                Tidy_Data[row, 3:numCols] <- colMeans(x[, 3:numCols]) 
                row = row+1 
                } 
        } 
write.table(Tidy_Data, "tidy_data.txt", row.names = FALSE)







