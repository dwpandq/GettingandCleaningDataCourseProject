# Loading appropriate library for project
library(dplyr)

# Clean up environment
rm(list = ls())

#################
# Download Data #
#################

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
########################################################################
# Step 1. Merges the training and the test sets to create one data set.#
########################################################################

# In order to prepare to merge data files - Create dataframes for the
# appropriate txt files
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                     col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                      col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                      col.names = "code")
###########################################################################
# 2. Extracts only the measurements on the mean and standard deviation for# 
# each measurement.                                                       #
###########################################################################



#############################################################################
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################


#########################################################################
# 4. Appropriately labels the data set with descriptive variable names. #
#########################################################################



###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set #
# with the average of each variable for each activity and each subject.       #
###############################################################################

