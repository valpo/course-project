# Getting and Cleaning Data course project
# Source script
The run_analysis.R script contains a function loadData(basedir=".") which
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
only average values is created, written to a file and finally returned from 
the loadData function.

The script depends on the plyr library. 

# Data
The dataset returned from loadData contains the following data:
 [1] "Activity"                    "Subject"                    
 [3] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
 [5] "tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
 [7] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
 [9] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"       
[11] "tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
[13] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
[15] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
[17] "tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"       
[19] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[21] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"         
[23] "tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
[25] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
[27] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
[29] "tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"      
[31] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[33] "tBodyAccMag.mean.."          "tBodyAccMag.std.."          
[35] "tGravityAccMag.mean.."       "tGravityAccMag.std.."       
[37] "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
[39] "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
[41] "tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."     
[43] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[45] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"           
[47] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
[49] "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
[51] "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
[53] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"       
[55] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[57] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"          
[59] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
[61] "fBodyAccMag.mean.."          "fBodyAccMag.std.."          
[63] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
[67] "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." 

Activity is one of the activity labels defined in activity_labels.txt, 
Subject identifies the subject performing the action (as a number between 
1 and 30). The other columns contain the aggregated mean values from 
the columns as defined in features_info.txt. 
