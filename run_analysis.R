# Clean up environment
rm(list = ls())

# Loading appropriate library for project
library(dplyr)

#Beginning of tracking runtime for code
start_time <- Sys.time()

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

# Preparation for merging data files - Create dataframes from the
# appropriate .txt files


features <- read.table("UCI HAR Dataset/features.txt",
                       col.names = c("rownumber","functions"),
                       colClasses = c("integer", "character"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt",
                         col.names = c("codenumber", "activity"),
                         colClasses = c("integer", "character"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",
                           col.names = "subject",
                           colClasses = "character")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                     col.names = features$functions,
                     colClasses = "numeric")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
                     col.names = "codenumber",
                     colClasses = "integer")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject",
                            colClasses = "character")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      col.names = features$functions,
                      colClasses = "numeric")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      col.names = "codenumber",
                      colClasses = "integer")

# Merge Datasets
xcombined <- rbind(x_train, x_test)
ycombined <- rbind(y_train, y_test)
subjectcombined <- rbind(subject_train, subject_test)
mergeddata <- cbind(subjectcombined, ycombined, xcombined)

###########################################################################
# 2. Extracts only the measurements on the mean and standard deviation for#
# each measurement.                                                       #
###########################################################################

#Uses only the mean and standard deviation measurements.
tidyupthedata <- mergeddata %>% select(subject, codenumber, contains("mean"), contains("std"))

#############################################################################
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################

# Uses the activity names already listed in the file activity_labels.txt
tidyupthedata$codenumber <- activities[tidyupthedata$codenumber, 2]

#########################################################################
# 4. Appropriately labels the data set with descriptive variable names. #
#########################################################################

# Cleaning up the messy column names.
names(tidyupthedata)[2] = "activity"
names(tidyupthedata) <- gsub("Acc", "Accelerometer", names(tidyupthedata))
names(tidyupthedata) <- gsub("Gyro", "Gyroscope", names(tidyupthedata))
names(tidyupthedata) <- gsub("BodyBody", "Body", names(tidyupthedata))
names(tidyupthedata) <- gsub("Mag", "Magnitude", names(tidyupthedata))
names(tidyupthedata) <- gsub("^t", "Time", names(tidyupthedata))
names(tidyupthedata) <- gsub("^f", "Frequency", names(tidyupthedata))
names(tidyupthedata) <- gsub("tBody", "TimeBody", names(tidyupthedata))
names(tidyupthedata) <- gsub("-mean()", "Mean", names(tidyupthedata),
    ignore.case = TRUE)
names(tidyupthedata) <- gsub("-std()", "STD", names(tidyupthedata),
    ignore.case = TRUE)
names(tidyupthedata) <- gsub("-freq()", "Frequency", names(tidyupthedata),
    ignore.case = TRUE)
names(tidyupthedata) <- gsub("angle", "Angle", names(tidyupthedata))
names(tidyupthedata) <- gsub("gravity", "Gravity", names(tidyupthedata))

###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set #
# with the average of each variable for each activity and each subject.       #
###############################################################################

cleaneddata <- tidyupthedata %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean))
write.table(cleaneddata, "projectresults.txt", row.name=FALSE)

# Double checking cleaned up names
head(cleaneddata)

# Verifying runtime of code
end_time <- Sys.time()
end_time - start_time
