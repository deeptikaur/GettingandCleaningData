###run_analysis.R

###Download the zipped Data and unzip it

###temp <- tempfile()
###download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = temp)
###unzip(temp)
###unlink(temp)

### Read relevant files for train and test 
subjtrain <- read.table("~/GettingandCleaningData/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
xtrain <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/train/X_train.txt", header=FALSE)
ytrain <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/train/y_train.txt", header=FALSE)
subjtest <- read.table("~/GettingandCleaningData/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
xtest <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/test/X_test.txt", header=FALSE)
ytest <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/test/y_test.txt", header=FALSE)
feature <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/features.txt", header=FALSE)
actlabel <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/UCI HAR Dataset/activity_labels.txt", header=FALSE)

### 1. Merge the test and train datasets
subjects <- rbind(subjtest, subjtrain)
observations <- rbind(xtest, xtrain)
activity <- rbind(ytest, ytrain)
columnnames <- feature$V2
for(i in 1:561){ names(observations)[i] <- as.character(columnnames[i]) }
activity <- rename (activity, activity= V1)
subjects <- rename (subjects, subjectid = V1)
mergeddata <- cbind(subjects,activity,observations)

### 2.Extracting only the measurements on the mean and standard deviation for each measurement.
Mean_Std <- grep("*mean\\(\\)*|*std*|*activity*|*subjectid*",as.character(names(mergeddata)), ignore.case = TRUE, value = TRUE)
meanstddt <- mergeddata[,Mean_Std]

###3. Using descriptive activity names to name the activities in the data set
meanstdactdt <- merge(meanstddt, actlabel, by.x = "activity", by.y="V1")
meanstdactdt <- subset(meanstdactdt, select = - activity)
meanstdactdt <- rename(meanstdactdt, activity = V2)
meanstdactdt <- select (meanstdactdt, subjectid, everything())

###4.Appropriately labeling the data set with descriptive variable names
names(meanstdactdt) <- gsub("^t", "Time", names(meanstdactdt))
names(meanstdactdt) <- gsub("^f", "Frequency", names(meanstdactdt))
names(meanstdactdt) <- gsub("*BodyBody*", "Body", names(meanstdactdt))
names(meanstdactdt) <- gsub("*Acc*", "Acceleration", names(meanstdactdt))
names(meanstdactdt) <- gsub("*Gyro*", "Gyroscope", names(meanstdactdt))
names(meanstdactdt) <- gsub("*Mag*", "Magnitude", names(meanstdactdt))
names(meanstdactdt) <- gsub("-", "", names(meanstdactdt))
names(meanstdactdt) <- gsub("\\(\\)", "", names(meanstdactdt))

###5.Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- aggregate(. ~subjectid + activity, meanstdactdt, mean)
tidydata <- tidydata[order(tidydata$subjectid,tidydata$activity),]

