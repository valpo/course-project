# Getting and Cleaning Data course project
# Source script
The run_analysis.R script contains a function loadData(basedir) which
reads several files contained in the 
projects dataset zipfile. It assumes the zipfile has been 
unpacked somewhere and expects the basedir (the dir containing 
the test/ and train/ subdirs) as parameter. 

The function first reads the features.txt to extract the column names 
for the datasets. 

In the next step it reads the train and test datasets from the 
X_train.txt and X_test.txt files into the loadtrain and loadtest 
datasets.

After that it reads the activity and subject lists from y_train.txt
and subject_train.txt and accordingly from y_test.txt and subject_test.txt. 
The activity numbers get mapped to activity strings using the 
mapping from activity_labels.txt.
Finally it appends the Activity and Subjects columns to the loadtrain 
and loadtest datasets. 

The next step combines the loadtrain and loadtest datasets into one 
dataset. All data columns which does not include mean- or std-values 
get removed from the final dataset. 

Using the aggregate function in the last step a new dataset containing 
only average values is created, written to file and finally returned from 
the loadData function.
