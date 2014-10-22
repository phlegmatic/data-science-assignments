require("plyr")
DataDir <- "UCI HAR Dataset/"
# Data directories and files
#test files
xTestFile  <- paste(DataDir, "test/X_test.txt", sep = "")
yTestFile  <- paste(DataDir, "test/y_test.txt", sep = "")
subjectTestFile <- paste(DataDir, "test/subject_test.txt", sep = "")
#training files
xTrainFile <- paste(DataDir, "train/X_train.txt", sep = "")
yTrainFile <- paste(DataDir, "train/y_train.txt", sep = "")
subjectTrainFile <- paste(DataDir, "train/subject_train.txt", sep = "")
#metadata files
featureFile <- paste(DataDir, "features.txt", sep = "")
activityLabelsFile <- paste(DataDir, "activity_labels.txt", sep = "")

#Loading raw data 

xTest <- read.table(xTestFile)
yTest <- read.table(yTestFile)
subjectTest <- read.table(subjectTestFile)

xTrain <- read.table(xTrainFile)
yTrain <- read.table(yTrainFile)
subjectTrain <- read.table(subjectTrainFile)

features <- read.table(featureFile,colClasses = c("character"))[,2] #selecting only second column with character values
activityLabels <- read.table(activityLabelsFile,col.names = c("ActivityId", "Activity")) #selecting only second colum 


#Q.2 Extracts only the measurements on the mean and standard deviation for each measurement
#selecting text measurements having mean and standard deviation
header <- features[grep("mean|std",features)]
header[80]<-"Subject"
header[81]<-"ActivityId"
colsHavingMeanStd<-grep("mean|std",features)# selecitng columns corresponding to mean/std data 
meansStdColnames<-colnames(xTest)[colsHavingMeanStd] #selecting column names
xtestSubset<-cbind(subset(xTest,select=meansStdColnames),subjectTest,yTest) #taking data from colnames having std and mean in it
xtrainSubset<-cbind(subset(xTrain,select=meansStdColnames),subjectTrain,yTrain)

#Q.1 merge test and train data
combinedTestTrainData <- rbind(xtrainSubset, xtestSubset) #combining rows of test and train and putting headers

#Q.4Appropriately labels the data set with descriptive variable names.
names(combinedTestTrainData)<-header #assigning header names
#making syntatically valid (removes parentheses, starting dots etc)
names(combinedTestTrainData) <- make.names(names(combinedTestTrainData))
#replacing starting letter "t" by "TimeDomain"
names(combinedTestTrainData) <- gsub('^t',"TimeDomain",names(combinedTestTrainData))
#replacing starting letter "f" by "FrequencyDomain"
names(combinedTestTrainData) <- gsub('^f',"FrequencyDomain",names(combinedTestTrainData))
#replacing "Mag" by "Magnitude"
names(combinedTestTrainData) <- gsub('Mag',"Magnitude",names(combinedTestTrainData))
#replacing "Acc" by "Acceleration"
names(combinedTestTrainData) <- gsub('Acc',"Acceleration",names(combinedTestTrainData))
#removing "." 
names(combinedTestTrainData) <- gsub('\\.',"",names(combinedTestTrainData))
#replacing Ending "Freq" by "Frequency"
names(combinedTestTrainData) <- gsub('Freq$',"Frequency",names(combinedTestTrainData))
#replacing Ending "std" by "StandardDeviation"
names(combinedTestTrainData) <- gsub('std',"StandardDeviation",names(combinedTestTrainData))
#replacing Ending "mean" by "Mean"
names(combinedTestTrainData) <- gsub('mean',"Mean",names(combinedTestTrainData))

#Q.3 Use descriptive activity names to name the activities in the data set
combinedTestTrainData<-join(combinedTestTrainData, activityLabels, by = "ActivityId", match = "first")#joining combinedTestTrainData and activityLabels on activityID column and keeping it first columns
combinedTestTrainData<-combinedTestTrainData[,-1]#removing first ActivityId columns

#Q.5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.
TidycombinedTestTrainData = ddply(combinedTestTrainData, c("Subject","Activity"), numcolwise(mean))
write.table(TidycombinedTestTrainData, file = "TidycombinedTestTrainData.txt", sep="\t", row.names=FALSE)

# use View(TidycombinedTestTrainData) in R to view the tidy dataset