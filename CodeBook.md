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

