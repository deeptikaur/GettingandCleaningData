README

The repository includes the following :

1.README.md, this file, which provides an overview of the data set and how it was created.
tidy_data.txt, which contains the data set.
2.CodeBook.md,  which describes the way the data was downloaded and all the variables created in the script for analysis as well as the variables in the final dataset. It also explains all the steps taken to create the final dataset. 
3.run_analysis.R, the R script with all the steps taken to manipulate the data to create the final tidydata dataset
4.tidydata.txt, the final dataset tidydata written as a txt file.

---------

How the script worked

1.Merged data from the two sets - test and train. Began by merging subjects data for both sets (subjects_train and subject_test), then activity data (y_train and y_test)for both sets followed by observations (x_train and x_test) data. 
2.Supplied variable names from the features.txt file to the observations column after merge. Also changed the column names for subjects and activity data frames to subject id and activity respectively.
3.Finally merged all the three resulting dataframes to create mergeddata dataframe.
4.Created a subset of the mergeddata dataframe called meanstddt pulling the columns subject id , activity and all that give mean and standard deviation of the measurements.
5.Merged the meanstddt and act_label dataframe based on the common data  (activity in meanstddt and V1 in act_label) to create meanstdactdt dataframe followed by deleting the activity column and renaming the column with activity names (V2) to actitivty and making it the second column of the meanstdactdt dataframe.
6.Replaced abbreviated column names by descriptive long and clean names.
7.Created tidydata dataframe that has  average of each variable in meanstdact for each activity and each subject.

------

The tidy_data.txt in this repository was created by running the run_analysis.R script using R version 3.4.2 (2017-09-28) on Windows 10 64-bit editionscript that was used to create the data set tidydata as per the requirements in the assignment.

