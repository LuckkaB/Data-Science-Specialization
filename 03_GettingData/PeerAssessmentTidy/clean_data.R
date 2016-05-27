## clean_data merges the data from the train set and the test set.
## The data frame has been extended. The first column contains the label
## of the activity (e.g. "WALKING", "STANDING",...)
## The column names consist of meaningfull names for the features
##
## @param location of the data set
## @return tidy data containing all features

clean_data <- function(location) {
  # load the data
  testData <- read.table(file=paste(location, "test/X_test.txt",sep=""))
  testLabels <- read.table(file=paste(location, "test/y_test.txt",sep=""))
  testSubjects <- read.table(file=paste(location, "test/subject_test.txt",sep=""))
  trainData <- read.table(file=paste(location, "train/X_train.txt",sep=""))
  trainLabels <- read.table(file=paste(location, "train/y_train.txt",sep=""))
  trainSubjects <- read.table(file=paste(location, "train/subject_train.txt",sep=""))
  featureNames <- read.table(file=paste(location, "features.txt",sep=""))
  activityLabels <- read.table(file=paste(location, "activity_labels.txt",sep=""))
  
  # replace activity int value by its name
  testLabels$V1 <- activityLabels$V2[testLabels$V1]
  trainLabels$V1 <- activityLabels$V2[trainLabels$V1]
  
  # cobine labels and data
  test <- cbind(testLabels, testSubjects, testData)
  train <- cbind(trainLabels, trainSubjects, trainData)
  
  data <- rbind(train, test)
  
  # name the columnes
  col_names <- as.character(featureNames$V2)
  col_names <- gsub("[-()]","",col_names)
  col_names <- gsub(",","_",col_names)
  colnames(data) <- c("activityLabel","subject",col_names)
  data
}