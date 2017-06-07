The following R packages are used in this script:

 - data.table:  performs fast aggregation of large data (e.g. 100GB in RAM),
	fast ordered joins, fast add/modify/delete of columns by group using
	no copies at all, list columns, a fast friendly file reader and
	parallel file writer.
 
 - dplyr: A fast, consistent tool for working with data frame like objects,
	both in memory and out of memory.

 - tidyr: An evolution of 'reshape2'. It's designed specifically for data
	tidying (not general reshaping or aggregating) and works well with
	'dplyr' data pipelines
 
 The variables used in the script are:
 
  - fileUrl: placeholder for the target URL from which dataset will be downloaded.
	Dataset will be stored locally as a file called HAR.zip, which will then be
	extracted to a local directory "./data" 
  
  - features: data.frame structure that will store the data read from features.txt
	file. It will be then transposed to serve as headings for the main data files
	X_train and X_test, after addint two additional columns: "Activity" and "Subject".
	
  - activities: data.frame structure that will store the data read from activity_labels.txt
	file. It will hold the names of the main activities tested: "WALKING", "WALKING_UPSTAIRS",
	"WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING".
  
  - y_train and y_test: data.frame structures that will store the data read
	from y_train.txt and y_test.txt files then merged into a single y_merged, which
	holds a mapping to which Activities (1 to 6) the various measurements were
	related.
	
  - subject_train and subject_test: data.frame structures that will store the data
	read from subject_train.txt and subject_test.txt files then merged into a
	single subject_merged, which holds a mapping from which Subjects (1 to 30)
	the various measurements were taken.
	
  - X_train and X_test: data.frame structures that will store the data read
	from X_train.txt and X_test.txt files then merged into a single X_merged, which
	holds the actual measurements. These are 10,299 total measurements for 561
	variables in addition to Activity and Subject.
	
  - X_merged2 is a subset of X_merged holding the 10,299 measurements but for only
	81 variables related to either mean() or std() of other variables/measurements.
	
  - X_merged3 is an independent data.frame structure built out of X_merged2, by
	computing the average measurements per Activity and per Subject. This is the
	final outcome of this assigment request and it is stored to file X_merged3.txt.
