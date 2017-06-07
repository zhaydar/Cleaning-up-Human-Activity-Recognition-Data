==================================================================
Human Activity Recognition Analysis
Version 0.1
==================================================================
Zaher Haydar
"Getting and Cleaning Data" (www.coursera.org/learn/data-cleaning) course
project as part of Coursera/John Hopkins Data Science Specialization
(www.coursera.org/specializations/jhu-data-science)
==================================================================


the run_analysis.r script uses an opend dataset that is made available by uci at: https://d396qusza40orc.cloudfront.net/getdata%2fprojectfiles%2fuci%20har%20dataset.zip. 
the dataset was collected by recording human activity recognition of 30 subjects performing
activities of daily living (adl) while carrying a waist-mounted smartphone with embedded
inertial sensors.  a full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones.


The workflow followed by the script is:
=======================================

0) Downloads HAR dataset from UCI open data repository and extracts all files to local
   working directory "./data"
1) Merges the training and the test sets to create one data set.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
5) From the data set in step 4, creates a second, independent tidy data set with the average
   of each variable for each activity and each subject.


The following data files were used as part of this analyis:
===========================================================

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Code Book:
==========
Please refer to CodeBook.md included in the same Github repository.


License:
========
The dataset used in this analysis is based on the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
