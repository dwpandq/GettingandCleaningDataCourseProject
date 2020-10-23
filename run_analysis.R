# Loading appropriate library for project
library(dplyr)


# Variables for download to reference
filename <- "dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Checking if file exists, if not downloads file.
if (!file.exists(filename)){
    download.file(fileURL, filename)
}  

# Checking if folder exists, if not unzips to specified directory.
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

# 1. Merges the training and the test sets to create one data set.


# 2. Extracts only the measurements on the mean and standard deviation for 
# each measurement.


# 3. Uses descriptive activity names to name the activities in the data set


# 4. Appropriately labels the data set with descriptive variable names.


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.