The Code Book
----------------
This is the description on the variables, the data, and the transformations performed to clean up the data.  

"Human Activity Recognition Using Smartphones Dataset" was used in this project.  The data were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data were obtained:

<url>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</url>

which can be downloaded at:

<url>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</url>


Raw Data
----------------
1. Training data  
  * Cases: 7352
  * Variables: 561

2. Testing data
  * Cases: 2947
  * Variables: 561

For information about the variables, summary choices, and experimental study design, see:
  * ./data/UCI\ HAR\ Dataset/README.txt
  * ./data/UCI\ HAR\ Dataset/features.txt
  * ./data/UCI\ HAR\ Dataset/features_info.txt


Tidy Data
----------------
`tidy_data.txt`
  * Cases: 180
  * Variables: 81

The Tidy Data were created by first merging the training and the test sets into one data set.  From this data set, the mean and standard deviation for each measurement were extracted.  The number of variables were reduced from 561 in the Raw Data to 79.  The merged data contained 10,299 cases.  Note that 'meanFreq' values were considered as part of the 'mean' group.  

Two variables: Subject, and Activity, were merged to the data set.  A new data frame was created from this data set with the average of each variable for each activity and each subject.  Thus, this tidy data frame contained 81 sets of variables.  Since each subject performed six different activity, and there were 30 subjects in total, the Tidy Data contained 180 cases (30 x 6).

'Subject' was the first column of the Tidy Data, indicating the ID of each subject.  The values in this first column were unitless. The second column was 'Activity' with six different factor values: walking, walking_upstairs, walking_downstairs, sitting, standing, and laying.  These values were also unitless.  The rest of the columns were average of either mean or standard deviation of the signals from the sensors.  Thus, the units should be the same as their corresponding measurements.  Since README.txt nor features_info.txt did not indicated whether these signals were collected in volts or millivolts, the author was not able to speculate the units of these columns.



