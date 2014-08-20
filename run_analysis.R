run_analysis <- function() {
        
        library(plyr)            # load plyr library for join operation
        
        trainFile <-"x_train.txt"                 # assign train file name
        testFile <- "x_test.txt"                  # assign test file name
        subjectTrainFile <- "subject_train.txt"         # assign subject train file name
        subjectTestFile <- "subject_test.txt"           # assign subject test file name
        activityTrainFile <- "y_train.txt"              # assign activity train file name
        activityTestFile <- "y_test.txt"                # assign activity test file name
        activityFile <- "activity_labels.txt"           # assign activity IDs and labels file name
        featuresFile <- "features.txt"                  # assign features file name
        featuresLongFile <- "features_long.txt"         # assign features long description file name
        destinationFile <- "tidy_data_samsung.txt"      # assign destination file name (save result set file name)
        
        if(!file.exists(trainFile)) {stop('cannot open train file')}                    # test if train file is in current folder
        if(!file.exists(testFile)) {stop('cannot open test file')}                      # test if test file is in current folder
        if(!file.exists(subjectTrainFile)) {stop('cannot open subject train file')}     # test if train file is in current folder
        if(!file.exists(subjectTestFile)) {stop('cannot open subject test file')}       # test if test file is in current folder
        if(!file.exists(activityTrainFile)) {stop('cannot open activity train file')}   # test if train file is in current folder
        if(!file.exists(activityTestFile)) {stop('cannot open activity test file')}     # test if test file is in current folder
        if(!file.exists(activityFile)) {stop('cannot open train file')}                 # test if activity file is in current folder
        if(!file.exists(featuresFile)) {stop('cannot open features file')}              # test if features file is in current folder
        if(!file.exists(featuresLongFile)) {stop('cannot open features long names file')}   # test if features long file is in current folder
        
        
        trainData <- read.table(trainFile,sep=" ")             # read train file data
        testData <- read.table(testFile,sep=" ")               # read test file data
        subjectTrain <- read.table(subjectTrainFile,sep=" ")   # read subject train file
        subjectTest <- read.table(subjectTestFile,sep=" ")     # read subject test file
        activityTrain <- read.table(activityTrainFile,sep=" ") # read activity id train file
        activityTest <- read.table(activityTestFile,sep=" ")   # read activity id test file
        features <- read.table(featuresFile,sep=" ")           # read features file to be used to name the columns
        featuresLong <- read.table(featuresLongFile,sep="\n")  # read features file to be used to name the columns
        
        names(subjectTrain) <- c("SUBJECT_ID")                  # rename column for the subject train data frame
        names(subjectTest) <- c("SUBJECT_ID")                   # rename column for the subject test data frame
        names(activityTrain) <- c("ACTID")                      # rename column for the activity train data frame (later used by join)
        names(activityTest) <- c("ACTID")                       # rename column for the activity test data frame  (later used by join)
        
        trainData$V1<- NULL                                     # remove first column with NA values
        testData$V1<- NULL                                      # remove first column with NA values

        names(trainData) <- features$V2         # assing train data set column names to features names
        names(testData) <- features$V2          # assing test data set column names to features names        

        includedList<-c(grep("std()", features$V2, value=TRUE), grep("mean()", features$V2, value=TRUE))        # get a list of all functions
        trainData<-trainData[,(colnames(trainData) %in% includedList)]                                          # remove columns that from train dataset are not mean() and std()
        testData<-testData[,(colnames(testData) %in% includedList)]                                             # remove columns from test dataset that are not mean() and std()

        names(trainData) <- featuresLong$V1        # assign descriptive long names to the columns in the train data set
        names(testData) <- featuresLong$V1         # assign descriptive long names to the columns in the test data set
        
        trainData<-cbind(subjectTrain,activityTrain,trainData)  # append column subject and activity ID to train data frame
        testData<-cbind(subjectTest,activityTest,testData)      # append column subject and activity ID to test data frame
        
        activities<-read.table(activityFile, sep=" ")   # read the activities description file
        names(activities)<-c("ACTID","ACTIVITY")        # set the column names to the activity dataset
        
        mergedDataSets <- rbind(trainData, testData)    # merge all the rows of test and train and save it to a new data frame
      
        # group merged data frame by activity and subject and calculate the mean to generate the tidy data set
        mergedDataSets <- aggregate(x=mergedDataSets,by=list(mergedDataSets$ACTID,mergedDataSets$SUBJECT_ID),FUN="mean")
        mergedDataSets$Group.1 <- NULL         # remove group by column same as SUBJECT_ID
        mergedDataSets$Group.2 <- NULL         # remove group by column same as ACTID

        mergedDataSets <- join(activities, mergedDataSets)       # add the activity descriptions with the matching ACTID as a column to the data frame
        mergedDataSets$ACTID <- NULL                            # remove activity ID ACTID column for the merged data.frame        
        
        write.table(mergedDataSets,destinationFile, row.name=FALSE)     # save merge data frame to a file
}