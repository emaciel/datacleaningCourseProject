#Samsung data 
##Coursera - Project Data Cleaning course

* Date: August 2014

All the necessary files to test the solution can be downloaded from:
* Data sets: [download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Features long description file: [download](https://github.com/emaciel/datacleaningCourseProject/blob/master/features_long.txt)
* R Script: [download](https://github.com/emaciel/datacleaningCourseProject/blob/master/run_analysis.R)
* Result data set: [download](https://github.com/emaciel/datacleaningCourseProject/blob/master/tidy_data_samsung.txt)
* Code book: [view](https://github.com/emaciel/datacleaningCourseProject/blob/master/codebook.md)


#Instruction List

##Environment

* Windows 7 Professional Operating System
* R Studio version 0.98.953
* R version 3.1.0
* Notepad++ or any text editor


##Assumptions
* All the files input files are located in the workspace directory ( `getwd()` )
* Package **_`plyr`_** is installed.

##Steps to achieve the results presented in the output file
####Prior to running the R script
1. Create one file called `features_long.txt` with the long (friendly) description of the 79 features in the result set (see features list tidy data - long description)
2. For the `x_test.txt` and the `x_train.txt` files, use a simple text editor ([Notepad++](http://notepad-plus-plus.org/), for example) and replace all double white spaces for single white spaces. This step will allow us to read the files using `read.table` in the R script without any errors.
3. The step above will allow the import of the file into R using read.table, but it will generate the first column with `NAs` values, because it will contain one white space in the beginning of every row.
4. Save all the files into your workspace directory (data sets, additional files and R script, for the full list refer to [code book](https://github.com/emaciel/datacleaningCourseProject/blob/master/codebook.md))
5. Import the run_analysis.R source code into R (`source("run_analysis.R")`)
6. Run the `run_analysis` function with the following parameters:
````
run_analysis( )
````



####R script `run_analysis` steps
1. Load the **_`plyr`_** library
2. Test if all the necessary files are present
3. Read the x_test.txt and the x_train.txt files to two data frames, one for each file
4. Remove the extra column with NAs from the data frames, this column is just a side product of the read.table command 
5. Read all remaining files (y_test, y_train, subject_test, subject_train, activity_labels, features_long and features) and store them in variables
6. Change the column name for the subject train and test data frames to `SUBJECT_ID`
7. Change the column name for the activity train and test data frames to `ACTID`, so it can be used to join the final dataset with the activity long description (see activity labels), instead of their ID's (1-6)
8. Name all the columns for the test and train data sets with the features (561 features) list (see features definition list)
9. Generate a list of the column names that will be included in the final dataset, the list is extracted from the features.txt file, and all columns that end in mean() and std(), are included, all others are excluded
10. Remove the unnecessary columns from the train and test data sets, and keep on the desired columns (the ones that are mean and standard deviation calculations). Note: the angle variables are discarded, because they use the value of some mean variables, but they are not a mean or standard deviation calculation.
11. Rename the columns in the train and test data set with the features long (friendly) values (see features list tidy data)
12. Append the subject, activity to the train and test data set. This will add 1 column with the subject ID and another with the activity ID for the train and test data frame.
13. Load from the file `activity_labels.txt` the IDs and the long description of each activity (see activity labels)
14. Rename the columns of the activity data frame to `ACTID` and `ACTIVITY` to facilitate the use of the join function
15. Merge the train and test data frames with the rbind function, and save it to another data frame
16. Remove the activity ID (`ACTID`) from the merged data frame, and keep only the activity long description
17. Group the merged data by the `SUBJECT_ID` and `ACTID` and calculate the mean of the grouped information (Used `aggregate` function to accomplish that)
18. Remove the Group.1 and Group.2 newly generated columns, because they are redundant and are the same are the `SUBJECT_ID` and `ACTID`
19. Use the `join` function to append the merged data frame with the activity list data frame.
20. Save the table to a file called tidy_data_samsung.txt, without the row names. The file will have 81 columns in total, 79 columns with all the means for the collected mean and standard deviation values and 2 with the subject ID and the activity label .



