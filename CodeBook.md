The run_analysis.R script prepares and manipulates the UCI HAR Dataset in a
manner that follows the prescribed directions:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for
    each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set
    with the average of each variable for each activity and each subject.

Downloading the UCI HAR Dataset
    The required dataset was downloaded and extracted to the UCI HAR Dataset
    folder.

Variable Data Assignment
    The appropriate datasets were evaluated and given the following variable names:

    1. features is assigned to a dataframe containing 561 rows and 2 columns describing information obtained from the accelerometerand the gyroscope.
    2. activities is assigned to a dataframe containing 6 rows and  2 columns describing a codenumber attributed to certain activities.
    3. subject_test is assigned to a dataframe containing 2947 rows and 1 column
    containing the subjects involved with the test.
    4. x_test is assigned to a dataframe containing 2947 rows and 561 columns
    which contains the test data.
    5. y_test is assigned to a dataframe containing 2947 rows and 1 column which describes the data labels being evaluated.
    6. subject_train is assigned to a dataframe containing 7352 rows and 1 column containing the subjects involved with the training.    
    7. x_train is assigned to a dataframe containing 7352 rows and 561 columns
    which contains the training data.
    8. y_train is assigned to a dataframe containing 7352 rows and 1 column
    which describes the data labels being evaluated.


The following datasets were merged to create one data set:
    1. xcombined describes the variable assigned to the merging of x_train and  x_test. 10299 rows and 561 columns.
    2. ycombined describes the variable assigned to the merging of y_train and y_test. 10299 rows and 1 column.
    3. subjectcombined describes the variable assigned to the merging of subject_train and subject_test. 10299 rows and 1 column.
    4. mergeddata describes the variable assigned to the merging of subjectcombined, ycombined and xcombined. 10299 rows and 563 columns.

Cleaning data:

    The variable tidydata, describes a dataset containing 10299 rows and 88 columns which is created by forming a subset of mergeddata by choosing only the subject, code, and measurements of the mean and the standard deviation.

It is then necessary to tidy up the data labels by fixing redundancies or by providing a better descriptor that is not abbreviated.
    1. The code column is renamed activities.
    2. Every Acc in the column heading is replaced with Accelerometer.
    3. Every Gyro in the column heading is replaced by Gyroscope.
    4. Every BodyBody in the column heading is paired down to just Body.
    5. Every Mag in the column heading is replaced by Magnitude.
    6. Every instance of f in the column heading is changed to Frequency.
    7. Every t in the column heading is changed to Time.


The final dataframe that is created is called cleaneddata. It describes the 180 rows and 88 columns which summarize the data that has been cleaned up and created to focus on the specific data we are looking for.

cleaneddata's information is then transfered to the projectresults.txt file.
