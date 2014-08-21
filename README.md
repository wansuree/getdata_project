Getting and Cleaning Data Course Project
------------------

The purpose of this project is to demonstrate how to collect, work with, and clean a data set.  The goal is to prepare tidy data that can be used for later analysis.

"Human Activity Recognition Using Smartphones Dataset" was used in this project.  The data were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data were obtained:

<url>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</url>

which can be downloaded at:

<url>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</url>


`run_analysis.R` does the following:
-----------------
After unzipping and loading the data, it

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The tidy data set is then uploaded to a text file called `tidy_data.txt`





