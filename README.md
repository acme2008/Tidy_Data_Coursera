# Tidy_Data_Coursera

# The script called run_analysis.R does the following: 
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Before running the script, please perform the following steps:
1. Download the data source for the project from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract the data from the UCI HAR Dataset zip in the folder you intend to use as your working directory
3. Save the 'run_analysis.R' script in the folder you intend to use as your working directory
4. Make sure you set that folder as your working directory using 'setwd()' function in RStudio
3. Run 'source("run_analysis.R")' in RStudio. It will create a new file called "tiny_data.txt" in your working directory.

# Dependencies
The script install the "data.table" and "dplyr" packages.
