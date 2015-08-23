loadData <- function(baseDir=".")
{
  library(plyr)
  ## load all datasets, merges it into one dataset which will be returned
  ## baseDir is the basedir for all data files, it should contain the test and train subdirs
  features <- read.table(file.path(baseDir,"features.txt"))
  collabels <- make.names(as.vector(features[,2]), unique=TRUE)

  # load data with right names (task 4)
  loadtrain <- read.table(file.path(baseDir,"train","X_train.txt"), col.names = collabels)
  loadtest  <- read.table(file.path(baseDir,"test","X_test.txt"), col.names = collabels)
  
  activityLabels <- read.table(file.path(baseDir,"activity_labels.txt"))
  
  # add activity and subject column to train data (task 3)
  activity <- read.table(file.path(baseDir,"train","y_train.txt"))
  activity <- mapvalues(activity[,1],activityLabels[,1],levels(activityLabels[,2]))
  loadtrain$Activity <- activity
  subject <- read.table(file.path(baseDir,"train", "subject_train.txt"))
  subject <- as.vector(subject[,1])
  loadtrain$Subjects <- subject
  
  # add activity and subject column to test data (task 3)
  activity <- read.table(file.path(baseDir,"test","y_test.txt"))
  activity <- mapvalues(activity[,1],activityLabels[,1],levels(activityLabels[,2]))
  loadtest$Activity <- activity
  subject <- as.vector(read.table(file.path(baseDir,"test", "subject_test.txt")))
  subject <- as.vector(subject[,1])
  loadtest$Subjects <- subject
  
  # finally unite both data sets (task 1)
  #rownames(loadtrain) <- NULL
  #rownames(loadtest) <- NULL
  res <- rbind(loadtrain, loadtest)
  
  # remove non -std or -mean columns (task 2)
  usecols <- collabels[grep(".*\\.(mean|std)\\.", collabels)]
  allcols <- append(usecols,c("Subjects","Activity"))
  res <- res[,allcols]
  
  # now calc the averages  (task 5)
  avg <- aggregate(res[,usecols], list(Activity=res$Activity,Subject=res$Subjects),mean)
  
  # write the avg back to a file
  write.table(avg, file="course-project-dat.txt",row.name=FALSE)
  
  # finally returning the avg data set
  avg
}