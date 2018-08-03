---
title: "CodeBook.md"
output: word_document
---
Study design
All data was present in a zip file at the location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following steps were followed to download and unzip the data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = temp)
unzip(temp)
unlink(temp)
-----
Variables Used in manipuation of data

subjtrain contains data read from the subjects_train.txt file in train folder
subjtest contains data read from the subjects_test.txt file in test folder
xtrain contains data read from the X_train.txt file in train folder
ytrain contains data read from the y_train.txt file in train folder
xtest contains data read from the X_test.txt file in test folder
ytest contains data read from the y_test.txt file in test folder
feature contains data read from the features.txt file 
actlabel contains data read from the activity_labels.txt file 
subjects contains combined data from subjtrain and subjtest
observations contains combined data from xtrain and xtest 
activity contains combined data from ytrain and ytest 
mergeddata contains combined data from subjects, activity and observations
columnnames contains data from the second column of feature
Mean_Std defines the code to extract columns with mean, standard deviation , subject id and activity from the mergeddata
meanstddt contains subset of mergeddata containing only mean and std deviation columns along with subject and activity columns
meanstdactdt contains data from meanstddt with activity names populated according to the activity labels
tidydata the final dataset that has values based on  average of each variable in meanstdact for each activity and each subject.


Variables in the final tidydata dataframe

 [1] "subjectid"                                  "activity"                                  
 [3] "TimeBodyAccelerationmeanX"                  "TimeBodyAccelerationmeanY"                 
 [5] "TimeBodyAccelerationmeanZ"                  "TimeBodyAccelerationstdX"                  
 [7] "TimeBodyAccelerationstdY"                   "TimeBodyAccelerationstdZ"                  
 [9] "TimeGravityAccelerationmeanX"               "TimeGravityAccelerationmeanY"              
[11] "TimeGravityAccelerationmeanZ"               "TimeGravityAccelerationstdX"               
[13] "TimeGravityAccelerationstdY"                "TimeGravityAccelerationstdZ"               
[15] "TimeBodyAccelerationJerkmeanX"              "TimeBodyAccelerationJerkmeanY"             
[17] "TimeBodyAccelerationJerkmeanZ"              "TimeBodyAccelerationJerkstdX"              
[19] "TimeBodyAccelerationJerkstdY"               "TimeBodyAccelerationJerkstdZ"              
[21] "TimeBodyGyroscopemeanX"                     "TimeBodyGyroscopemeanY"                    
[23] "TimeBodyGyroscopemeanZ"                     "TimeBodyGyroscopestdX"                     
[25] "TimeBodyGyroscopestdY"                      "TimeBodyGyroscopestdZ"                     
[27] "TimeBodyGyroscopeJerkmeanX"                 "TimeBodyGyroscopeJerkmeanY"                
[29] "TimeBodyGyroscopeJerkmeanZ"                 "TimeBodyGyroscopeJerkstdX"                 
[31] "TimeBodyGyroscopeJerkstdY"                  "TimeBodyGyroscopeJerkstdZ"                 
[33] "TimeBodyAccelerationMagnitudemean"          "TimeBodyAccelerationMagnitudestd"          
[35] "TimeGravityAccelerationMagnitudemean"       "TimeGravityAccelerationMagnitudestd"       
[37] "TimeBodyAccelerationJerkMagnitudemean"      "TimeBodyAccelerationJerkMagnitudestd"      
[39] "TimeBodyGyroscopeMagnitudemean"             "TimeBodyGyroscopeMagnitudestd"             
[41] "TimeBodyGyroscopeJerkMagnitudemean"         "TimeBodyGyroscopeJerkMagnitudestd"         
[43] "FrequencyBodyAccelerationmeanX"             "FrequencyBodyAccelerationmeanY"            
[45] "FrequencyBodyAccelerationmeanZ"             "FrequencyBodyAccelerationstdX"             
[47] "FrequencyBodyAccelerationstdY"              "FrequencyBodyAccelerationstdZ"             
[49] "FrequencyBodyAccelerationJerkmeanX"         "FrequencyBodyAccelerationJerkmeanY"        
[51] "FrequencyBodyAccelerationJerkmeanZ"         "FrequencyBodyAccelerationJerkstdX"         
[53] "FrequencyBodyAccelerationJerkstdY"          "FrequencyBodyAccelerationJerkstdZ"         
[55] "FrequencyBodyGyroscopemeanX"                "FrequencyBodyGyroscopemeanY"               
[57] "FrequencyBodyGyroscopemeanZ"                "FrequencyBodyGyroscopestdX"                
[59] "FrequencyBodyGyroscopestdY"                 "FrequencyBodyGyroscopestdZ"                
[61] "FrequencyBodyAccelerationMagnitudemean"     "FrequencyBodyAccelerationMagnitudestd"     
[63] "FrequencyBodyAccelerationJerkMagnitudemean" "FrequencyBodyAccelerationJerkMagnitudestd" 
[65] "FrequencyBodyGyroscopeMagnitudemean"        "FrequencyBodyGyroscopeMagnitudestd"        
[67] "FrequencyBodyGyroscopeJerkMagnitudemean"    "FrequencyBodyGyroscopeJerkMagnitudestd"   
------

Steps

1.Merged data from the two sets - test and train. Began by merging subjects data for both sets (subjects_train and subject_test), then activity data (y_train and y_test)for both sets followed by observations (x_train and x_test) data. 
2.Supplied variable names from the features.txt file to the observations column after merge. Also changed the column names for subjects and activity data frames to subject id and activity respectively.
3.Finally merged all the three resulting dataframes to create mergeddata dataframe.
4.Created a subset of the mergeddata dataframe called meanstddt pulling the columns subject id , activity and all that give mean and standard deviation of the measurements.
5.Merged the meanstddt and act_label dataframe based on the common data  (activity in meanstddt and V1 in act_label) to create meanstdactdt dataframe followed by deleting the activity column and renaming the column with activity names (V2) to actitivty and making it the second column of the meanstdactdt dataframe.
6.Replaced abbreviated column names by descriptive long and clean names.
7.Created tidydata dataframe that has  average of each variable in meanstdact for each activity and each subject.

------

