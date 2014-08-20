# ## check/create a dir called "data"
# if(!file.exists("data")) {
#     dir.create("data")
# }
# 
# ## download the zip file
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")
# unzip("./data/Dataset.zip", exdir = "./data/")

## load the data
activity_labels <- read.csv("./data/UCI\ HAR\ Dataset/activity_labels.txt", 
                            sep = " ", header = FALSE, stringsAsFactors=FALSE)
activity_labels$V2 <- sapply(activity_labels$V2, tolower)

features <- read.csv("./data/UCI\ HAR\ Dataset/features.txt", 
                      sep = " ", header = FALSE, stringsAsFactors=FALSE)

subject_train <- read.csv("./data/UCI\ HAR\ Dataset/train/subject_train.txt", 
                          sep = "", header = FALSE, stringsAsFactors=FALSE)
X_train <- read.csv("./data/UCI\ HAR\ Dataset/train/X_train.txt", 
                    sep = "", header = FALSE, stringsAsFactors=FALSE)
y_train <- read.csv("./data/UCI\ HAR\ Dataset/train/y_train.txt", 
                    sep = "", header = FALSE, stringsAsFactors=FALSE)

subject_test <- read.csv("./data/UCI\ HAR\ Dataset/test/subject_test.txt", 
                         sep = "", header = FALSE, stringsAsFactors=FALSE)
X_test <- read.csv("./data/UCI\ HAR\ Dataset/test/X_test.txt", 
                   sep = "", header = FALSE, stringsAsFactors=FALSE)
y_test <- read.csv("./data/UCI\ HAR\ Dataset/test/y_test.txt", 
                   sep = "", header = FALSE, stringsAsFactors=FALSE)

## 1. Merges the training and the test sets to create one data set.
df <- rbind(X_train, X_test)

## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
toMatch <- c("mean", "std")
matches <- unique(grep(paste(toMatch, collapse = "|"), features$V2))
df <- df[, matches]

## 3. Uses descriptive activity names to name the activities in the data set.
activity <- rbind(y_train, y_test)
activity$V1 <- activity_labels$V2[activity$V1]

## 4. Appropriately labels the data set with descriptive variable names.
df <- cbind(rbind(subject_train, subject_test), activity, df)
varnames <- unique(grep(paste(toMatch, collapse = "|"), 
                        features$V2, value = TRUE))
names(df) <- c("subject", "activity", varnames)

## 5. Creates a second, independent tidy data set with the average of 
##    each variable for each activity and each subject.
df2 <- aggregate(df[, 3:81], list(Activity = df$activity, Subject = df$subject), mean)
write.table(df2, file = "./data/tidy_data.txt")