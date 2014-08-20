#Code Book for Samsung data 
(Coursera Project Data Cleaning course)

##Date
* Processing was done in August 2014
* Date set date October 10th 2012

##R Source file
R source code file: [run_analysis.R](https://github.com/emaciel/datacleaningCourseProject/blob/master/run_analysis.R)

##Study Design

The study design section describes the Inputs and the outputs of the analysis.
###Inputs

The data sets in this analysis were downloaded from UCI Machine Learning Repository, more specifically Human Activity Recognition Using Smartphone Data Set.

**Source:** The original data files were downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The official website with the data description is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
* Data set is multivariate and time-series
* Number of instances (rows) 10,299
* Number of attributes (columns) 561


The following table lists all necessary files for the `run_analysis( )` function to run. These files need to be located in the working directory in R (`getwd()`).

|Files| Number of Lines | Number of columns |
|-----|:---------------:|:-----------------:|
|features.txt| 561 | 2 |
|features_long.txt| 561 | 1 |
|activity_labels.txt| 6 | 2 |
|subject_test.txt| 2947 | 1 |
|subject_train.txt| 7352 | 1 |
|x_test.txt| 2947 | 561 |
|x_train.txt| 7352 | 561 |
|y_test.txt| 2947 | 1 |
|y_train.txt| 7352 | 1 |

* Total number of rows 10,299
* The relationship between the files is the number of lines, each line represents one subject, one the activity and 561 observations
* The subject, x and y for test data set has the same number of lines, so each line (row) corresponds to one set of values (obsearvation) for one individual, performing one activity.
* The above statement is also true for the train data set.
* The subject / activity is repeated several times (more than one observation - line - per subject / activity pair)
* The files ending in **_train** form the complete data set for the train data.
* The files ending in **_test** form the complete data set for the test data.
* The observations are divided in 2 data sets
	* Train data set - 70% of the observations
	* Test data set - 30% of the observations

###Input files description

File name | Description
----------|------------
features.txt | 561 different features (observations) that were measured using a wearable gadget. (See complete features definition list)
features_long.txt | 79 different long (friendly) description for each column in the result set (See features tidy data definition)
activity_labels.txt | 6 activity labels, defined by ID and description of the activities. (see activity labels)
subject_test.txt | list of all the subjects for the test data set. (possible values 1 to 30)
subject_train.txt | list of all the subjects for the train data set. (possible values 1 to 30)
x_test.txt | values for all the 561 measurements for the test data set, defined by the features list (possible values -1 to 1)
x_train.txt | values for all the 561 measurements for the train date set, defined by the features list (possible values -1 to 1)
Y_test.txt | list of the activities performed for test data set (valid values 1 to 6)
y_train.txt | list of the activities performed for train data set (valid values 1 to 6)

###Output
* Tidy data set saved to file called `tidy_data_samsung.txt` to the current workspace ( `getwd()` ), composed by merging the train and test data sets, and calculating the mean grouped by the subject ID (person) and activity of the measurements.
* The mean values are normalized and will be values between -1 and 1.
* Activity has 6 possible values (see activity list)
* Subject ID is a value between 1 to 30
* The pair subject ID and activity are unique (one row per pair)
* `tidy_data_samsung.txt` - 79 variables composed by the mean values of the mean or standard deviation of the observations of the merged train and test data sets, group by subject ID and activity type
* 81 colums in total - Subject ID, Activity and 79 mean values, grouped by the subject and the activity (see table below) 
* The result files will contain 180 rows of data (mean values for the observations)
	* 1 Header row with the long descriptive name for each column
	* 30 Subjects (individuals)
	* 6 Actvities (see list of activities table)
	* 79 columns with mean values for the selected observations (see List of features in the tidy data set)

| Column | Possible Values |
|----------|:----------:|
| Subject ID | 1 to 30 |
| Activity | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| Mean values (79 colums) | -1.0 to 1.0 |


| ACTIVITY | SUBJECT ID | 79 columns (see list of features tidy data set)  |
|----------|:----------:|-------------|
| WALKING  | 1 | _79 mean values_ |
| STANDING | 1 | _79 mean values_ |
| ...      | ...| ... |
| WALKING  | 2 | _79 mean values_ |
| STANDING | 2 | _79 mean values_ |
| ...      | ...| ... |


##R code variables
###Hard-coded parameters
Variable  | Value | Source |
----------|-------|--------|
trainFile | "x_train.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
testFile | "x_test.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
subjectTrainFile | "subject_train.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
subjectTestFile | "subject_test.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
activityTrainFile | "y_train.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
activityTestFile | "y_test.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
activityFile | "activity_labels.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)|
featuresFile | "features.txt" | [Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) |
featuresLongFile | "features_long.txt" | [Source](https://github.com/emaciel/datacleaningCourseProject/blob/master/features_long.txt) |
destinationFile | "tidy_data_samsung.txt" | [Source](https://github.com/emaciel/datacleaningCourseProject/blob/master/tidy_data_samsung.txt) |


###R code variables

Variable  | Description              | Number columns |
----------|--------------------------|:--------------:|
trainFile | Train data set file name | - |
testFile | Test data set file name | - |
subjectTrainFile | Subject train file name | - |
subjectTestFile | Subject test file name | - |
activityTrainFile | Activity train file name | - | 
activityTestFile | Activity test file name | - |
activityFile | Activity list of values file name | - |
featuresFile | Features list of values file name | - |
featuresLongFile | Features list of long description file name | - |
destinationFile | Destination file name | - |
trainData | List of values for all observations for the train data set | 561 
testData | List of values for all observations for the test data set | 561 
subjectTrain | List of numeric identifier (ID) for the subjects (people) in the train data set | 1 
subjectTest | List of numeric identifier (ID) for the subjects(people) in the test data set | 1 
activityTrain | List of numeric identifier (ID) for the activity int the train being performed | 1 
activityTest  | List of numeric identifier (ID) for the activity int the test being performed | 1 
featuresLong | List of the long description (friendly) for 79 resulting columns | 1
features | List of features, all the observations (561 features) | 1 
activities | List of all activities and its identifier (ID) | 2 
mergedDataSets | List of mean values for selected observations, activity description, and subject ID | 81
includedList | List of all the features included in the test and train data set (561 values) | 1


##Activity Labels
Activity ID (`ACTID`) | Activity Label (`ACTIVITY`)
:----------:|---------------
1|WALKING
2|WALKING_UPSTAIRS
3|WALKING_DOWNSTAIRS
4|SITTING
5|STANDING
6|LAYING

##List of Features (observations) in the tidy data set

* The total number of features (observations) in the resulting tidy data set is 79. 
* Features starting with a **t** pertain to the time domain
* Features starting with a **f** pertain to the frequency domain
* The long description is the set of values contained in the `features_long.txt` file
* All values (observations) for all features are normalized and are in the interval -1.0 to 1.0

See list below.

| Feature Number |	Feature ID	|	Feature Name	| Long Description |
|:--------------:|:-------------:|------------------|----------------------|
|	1	|	1	|	tBodyAcc-mean()-X	| Mean value of time domain signal of the body acceleration in the X axis |
|	2	|	2	|	tBodyAcc-mean()-Y	| Mean value of time domain signal of the body acceleration in the Y axis  |
|	3	|	3	|	tBodyAcc-mean()-Z	| Mean value of time domain signal of the body acceleration in the Z axis  |
|	4	|	4	|	tBodyAcc-std()-X	| Standard Deviation value of time domain signal of the body acceleration in the X axis  |
|	5	|	5	|	tBodyAcc-std()-Y	| Standard Deviation value of time domain signal of the body acceleration in the Y axis  |
|	6	|	6	|	tBodyAcc-std()-Z	| Standard Deviation value of time domain signal of the body acceleration in the Z axis  |
|	7	|	41	|	tGravityAcc-mean()-X	| Mean value of time domain signal of the gravity acceleration in the X axis  |
|	8	|	42	|	tGravityAcc-mean()-Y	| Mean value of time domain signal of the gravity acceleration in the Y axis  |
|	9	|	43	|	tGravityAcc-mean()-Z	| Mean value of time domain signal of the gravity acceleration in the Z axis  |
|	10	|	44	|	tGravityAcc-std()-X	| Standard Deviation value of time domain signal of the gravity acceleration in the X axis  |
|	11	|	45	|	tGravityAcc-std()-Y	| Standard Deviation value of time domain signal of the gravity acceleration in the Y axis  |
|	12	|	46	|	tGravityAcc-std()-Z	| Standard Deviation value of time domain signal of the gravity acceleration in the Z axis  |
|	13	|	81	|	tBodyAccJerk-mean()-X	| Mean value of time domain signal of the Body acceleration Jerk in the X axis  |
|	14	|	82	|	tBodyAccJerk-mean()-Y	| Mean value of time domain signal of time domain signal of the Body acceleration Jerk in the Y axis  |
|	15	|	83	|	tBodyAccJerk-mean()-Z	| Mean value of time domain signal of the Body acceleration Jerk in the Z axis  |
|	16	|	84	|	tBodyAccJerk-std()-X	| Standard Deviation value of time domain signal of the Body acceleration Jerk in the X axis  |
|	17	|	85	|	tBodyAccJerk-std()-Y	| Standard Deviation value of time domain signal of the Body acceleration Jerk in the Y axis  |
|	18	|	86	|	tBodyAccJerk-std()-Z	| Standard Deviation value of time domain signal of the Body acceleration Jerk in the Z axis  |
|	19	|	121	|	tBodyGyro-mean()-X	| Mean value of time domain signal of the Body gyroscope in the X axis  |
|	20	|	122	|	tBodyGyro-mean()-Y	| Mean value of time domain signal of the Body gyroscope in the Y axis  |
|	21	|	123	|	tBodyGyro-mean()-Z	| Mean value of time domain signal of the Body gyroscope in the Z axis  |
|	22	|	124	|	tBodyGyro-std()-X	| Standard Deviation value of time domain signal of the Body gyroscope in the X axis  |
|	23	|	125	|	tBodyGyro-std()-Y	| Standard Deviation value of time domain signal of the Body gyroscope in the Y axis  |
|	24	|	126	|	tBodyGyro-std()-Z	| Standard Deviation value of time domain signal of the Body gyroscope in the Z axis  |
|	25	|	161	|	tBodyGyroJerk-mean()-X	| Mean value of time domain signal of the Body gyroscope Jerk in the X axis  |
|	26	|	162	|	tBodyGyroJerk-mean()-Y	| Mean value of time domain signal of the Body gyroscope Jerk in the Y axis  |
|	27	|	163	|	tBodyGyroJerk-mean()-Z	| Mean value of time domain signal of the Body gyroscope Jerk in the Z axis  |
|	28	|	164	|	tBodyGyroJerk-std()-X	| Standard Deviation value of time domain signal of the Body gyroscope Jerk in the X axis  |
|	29	|	165	|	tBodyGyroJerk-std()-Y	| Standard Deviation value of time domain signal of the Body gyroscope Jerk in the Y axis  |
|	30	|	166	|	tBodyGyroJerk-std()-Z	| Standard Deviation value of time domain signal of the Body gyroscope Jerk in the Z axis  |
|	31	|	201	|	tBodyAccMag-mean()	| Mean value of time domain signal for the body acceleration magnitude  |
|	32	|	202	|	tBodyAccMag-std()	| Standard Deviation value of time domain signal for the body acceleration magnitude  |
|	33	|	214	|	tGravityAccMag-mean()	| Mean value of time domain signal for the Gravity Accelaration magnitude  |
|	34	|	215	|	tGravityAccMag-std()	| Standard Deviation value of time domain signal for the Gravity Accelaration magnitude  |
|	35	|	227	|	tBodyAccJerkMag-mean()	| Mean value of time domain signal for the Body acceleration Jerk magnitude  | 
|	36	|	228	|	tBodyAccJerkMag-std()	| Standard Deviation value of time domain signal for the Body Accelaration Jerk magnitude  |
|	37	|	240	|	tBodyGyroMag-mean()	| Mean value of time domain signal for the Body Gyroscope magnitude  |
|	38	|	241	|	tBodyGyroMag-std()	| Standard Deviation value of time domain signal for the Body Gyroscope magnitude  |
|	39	|	253	|	tBodyGyroJerkMag-mean()	| Mean value of time domain signal for the Body Gyroscope Jerk magnitude  |
|	40	|	254	|	tBodyGyroJerkMag-std()	| Standard Deviation value of time domain signal for the Body Gyroscope Jerk magnitude  |
|	41	|	266	|	fBodyAcc-mean()-X	| Mean value of frequency domain signal for the body acceleration in the X axis |
|	42	|	267	|	fBodyAcc-mean()-Y	| Mean value of frequency domain signal for the body acceleration in the Y axis |
|	43	|	268	|	fBodyAcc-mean()-Z	| Mean value of frequency domain signal for the body acceleration in the Z axis |
|	44	|	269	|	fBodyAcc-std()-X	| Standard Deviation value of frequency domain signal for the body acceleration in the X axis |
|	45	|	270	|	fBodyAcc-std()-Y	| Standard Deviation value of frequency domain signal for the body acceleration in the Y axis |
|	46	|	271	|	fBodyAcc-std()-Z	| Standard Deviation value of frequency domain signal for the body acceleration in the Z axis |
|	47	|	294	|	fBodyAcc-meanFreq()-X	| Mean frequency value of frequency domain signal for the body acceleration in the X axis |
|	48	|	295	|	fBodyAcc-meanFreq()-Y	| Mean frequency value of frequency domain signal for the body acceleration in the Y axis |
|	49	|	296	|	fBodyAcc-meanFreq()-Z	| Mean frequency value of frequency domain signal for the body acceleration in the Z axis |
|	50	|	345	|	fBodyAccJerk-mean()-X	| Mean value of frequency domain signal for the body acceleration Jerk in the X axis |
|	51	|	346	|	fBodyAccJerk-mean()-Y	| Mean value of frequency domain signal for the body acceleration Jerk in the Y axis |
|	52	|	347	|	fBodyAccJerk-mean()-Z	| Mean value of frequency domain signal for the body acceleration Jerk in the Z axis |
|	53	|	348	|	fBodyAccJerk-std()-X	| Standard Deviation value of frequency domain signal for the body acceleration Jerk in the X axis |
|	54	|	349	|	fBodyAccJerk-std()-Y	| Standard Deviation value of frequency domain signal for the body acceleration Jerk in the Y axis |
|	55	|	350	|	fBodyAccJerk-std()-Z	| Standard Deviation value of frequency domain signal for the body acceleration Jerk in the Z axis |
|	56	|	373	|	fBodyAccJerk-meanFreq()-X	| Mean frequency value of frequency domain signal for the body acceleration Jerk in the X axis |
|	57	|	374	|	fBodyAccJerk-meanFreq()-Y	| Mean frequency value of frequency domain signal for the body acceleration Jerk in the Y axis |
|	58	|	375	|	fBodyAccJerk-meanFreq()-Z	| Mean frequency value of frequency domain signal for the body acceleration Jerk in the Z axis |
|	59	|	424	|	fBodyGyro-mean()-X	| Mean value of frequency domain signal of the body gyroscope in the X axis |
|	60	|	425	|	fBodyGyro-mean()-Y	| Mean value of frequency domain signal of the body gyroscope in the Y axis |
|	61	|	426	|	fBodyGyro-mean()-Z	| Mean value of frequency domain signal of the body gyroscope in the Z axis |
|	62	|	427	|	fBodyGyro-std()-X	| Standard Deviation value of frequency domain signal of the body gyroscope in the X axis |
|	63	|	428	|	fBodyGyro-std()-Y	| Standard Deviation value of frequency domain signal of the body gyroscope in the Y axis |
|	64	|	429	|	fBodyGyro-std()-Z	| Standard Deviation value of frequency domain signal of the body gyroscope in the Z axis |
|	65	|	452	|	fBodyGyro-meanFreq()-X	| Mean frequency value of frequency domain signal of the body gyroscope in the X axis |
|	66	|	453	|	fBodyGyro-meanFreq()-Y	| Mean frequency value of frequency domain signal of the body gyroscope in the Y axis |
|	67	|	454	|	fBodyGyro-meanFreq()-Z	| Mean frequency value of frequency domain signal of the body gyroscope in the Z axis |
|	68	|	503	|	fBodyAccMag-mean()	| Mean value of frequency domain signal for the body acceleration magnitude |
|	69	|	504	|	fBodyAccMag-std()	| Standard Deviation value of frequency domain signal for the body acceleration magnitude |
|	70	|	513	|	fBodyAccMag-meanFreq()	| Mean frequency value of the frequency domain signal for the body acceleration magnitude |
|	71	|	516	|	fBodyBodyAccJerkMag-mean() | Mean value of the frequency domain signal for the body accelaration jerk magnitude |
|	72	|	517	|	fBodyBodyAccJerkMag-std()	| Standard Deviation value of the frequency domain signal for the body accelaration jerk magnitude |
|	73	|	526	|	fBodyBodyAccJerkMag-meanFreq()	| Mean frequency value of the frequency domain signal for the body acceleration jerk magnitude |
|	74	|	529	|	fBodyBodyGyroMag-mean()	| Mean value of the frequency domain signal for the body gyroscope jerk magnitude |
|	75	|	530	|	fBodyBodyGyroMag-std()	| Standard Deviation value of the frequency domain signal for the body gyroscope jerk magnitude |
|	76	|	539	|	fBodyBodyGyroMag-meanFreq()	| Mean frequency value of the frequency domain signal for the body gyroscope magnitude |
|	77	|	542	|	fBodyBodyGyroJerkMag-mean()	| Mean value of the frequency domain signal for the body gyroscope jerk magnitude |
|	78	|	543	|	fBodyBodyGyroJerkMag-std()	| Standard Deviation value of the frequency domain signal for the body gyroscope jerk magnitude |
|	79	|	552	|	fBodyBodyGyroJerkMag-meanFreq()	| Mean frequency value of the frequency domain signal for the body gyroscope jerk magnitude |



##Complete Features (observations) definition List

|	Feature ID	|	Feature Definition	|
|:-------------:|----------------------|
|	1	|	tBodyAcc-mean()-X	|
|	2	|	tBodyAcc-mean()-Y	|
|	3	|	tBodyAcc-mean()-Z	|
|	4	|	tBodyAcc-std()-X	|
|	5	|	tBodyAcc-std()-Y	|
|	6	|	tBodyAcc-std()-Z	|
|	7	|	tBodyAcc-mad()-X	|
|	8	|	tBodyAcc-mad()-Y	|
|	9	|	tBodyAcc-mad()-Z	|
|	10	|	tBodyAcc-max()-X	|
|	11	|	tBodyAcc-max()-Y	|
|	12	|	tBodyAcc-max()-Z	|
|	13	|	tBodyAcc-min()-X	|
|	14	|	tBodyAcc-min()-Y	|
|	15	|	tBodyAcc-min()-Z	|
|	16	|	tBodyAcc-sma()	|
|	17	|	tBodyAcc-energy()-X	|
|	18	|	tBodyAcc-energy()-Y	|
|	19	|	tBodyAcc-energy()-Z	|
|	20	|	tBodyAcc-iqr()-X	|
|	21	|	tBodyAcc-iqr()-Y	|
|	22	|	tBodyAcc-iqr()-Z	|
|	23	|	tBodyAcc-entropy()-X	|
|	24	|	tBodyAcc-entropy()-Y	|
|	25	|	tBodyAcc-entropy()-Z	|
|	26	|	tBodyAcc-arCoeff()-X,1	|
|	27	|	tBodyAcc-arCoeff()-X,2	|
|	28	|	tBodyAcc-arCoeff()-X,3	|
|	29	|	tBodyAcc-arCoeff()-X,4	|
|	30	|	tBodyAcc-arCoeff()-Y,1	|
|	31	|	tBodyAcc-arCoeff()-Y,2	|
|	32	|	tBodyAcc-arCoeff()-Y,3	|
|	33	|	tBodyAcc-arCoeff()-Y,4	|
|	34	|	tBodyAcc-arCoeff()-Z,1	|
|	35	|	tBodyAcc-arCoeff()-Z,2	|
|	36	|	tBodyAcc-arCoeff()-Z,3	|
|	37	|	tBodyAcc-arCoeff()-Z,4	|
|	38	|	tBodyAcc-correlation()-X,Y	|
|	39	|	tBodyAcc-correlation()-X,Z	|
|	40	|	tBodyAcc-correlation()-Y,Z	|
|	41	|	tGravityAcc-mean()-X	|
|	42	|	tGravityAcc-mean()-Y	|
|	43	|	tGravityAcc-mean()-Z	|
|	44	|	tGravityAcc-std()-X	|
|	45	|	tGravityAcc-std()-Y	|
|	46	|	tGravityAcc-std()-Z	|
|	47	|	tGravityAcc-mad()-X	|
|	48	|	tGravityAcc-mad()-Y	|
|	49	|	tGravityAcc-mad()-Z	|
|	50	|	tGravityAcc-max()-X	|
|	51	|	tGravityAcc-max()-Y	|
|	52	|	tGravityAcc-max()-Z	|
|	53	|	tGravityAcc-min()-X	|
|	54	|	tGravityAcc-min()-Y	|
|	55	|	tGravityAcc-min()-Z	|
|	56	|	tGravityAcc-sma()	|
|	57	|	tGravityAcc-energy()-X	|
|	58	|	tGravityAcc-energy()-Y	|
|	59	|	tGravityAcc-energy()-Z	|
|	60	|	tGravityAcc-iqr()-X	|
|	61	|	tGravityAcc-iqr()-Y	|
|	62	|	tGravityAcc-iqr()-Z	|
|	63	|	tGravityAcc-entropy()-X	|
|	64	|	tGravityAcc-entropy()-Y	|
|	65	|	tGravityAcc-entropy()-Z	|
|	66	|	tGravityAcc-arCoeff()-X,1	|
|	67	|	tGravityAcc-arCoeff()-X,2	|
|	68	|	tGravityAcc-arCoeff()-X,3	|
|	69	|	tGravityAcc-arCoeff()-X,4	|
|	70	|	tGravityAcc-arCoeff()-Y,1	|
|	71	|	tGravityAcc-arCoeff()-Y,2	|
|	72	|	tGravityAcc-arCoeff()-Y,3	|
|	73	|	tGravityAcc-arCoeff()-Y,4	|
|	74	|	tGravityAcc-arCoeff()-Z,1	|
|	75	|	tGravityAcc-arCoeff()-Z,2	|
|	76	|	tGravityAcc-arCoeff()-Z,3	|
|	77	|	tGravityAcc-arCoeff()-Z,4	|
|	78	|	tGravityAcc-correlation()-X,Y	|
|	79	|	tGravityAcc-correlation()-X,Z	|
|	80	|	tGravityAcc-correlation()-Y,Z	|
|	81	|	tBodyAccJerk-mean()-X	|
|	82	|	tBodyAccJerk-mean()-Y	|
|	83	|	tBodyAccJerk-mean()-Z	|
|	84	|	tBodyAccJerk-std()-X	|
|	85	|	tBodyAccJerk-std()-Y	|
|	86	|	tBodyAccJerk-std()-Z	|
|	87	|	tBodyAccJerk-mad()-X	|
|	88	|	tBodyAccJerk-mad()-Y	|
|	89	|	tBodyAccJerk-mad()-Z	|
|	90	|	tBodyAccJerk-max()-X	|
|	91	|	tBodyAccJerk-max()-Y	|
|	92	|	tBodyAccJerk-max()-Z	|
|	93	|	tBodyAccJerk-min()-X	|
|	94	|	tBodyAccJerk-min()-Y	|
|	95	|	tBodyAccJerk-min()-Z	|
|	96	|	tBodyAccJerk-sma()	|
|	97	|	tBodyAccJerk-energy()-X	|
|	98	|	tBodyAccJerk-energy()-Y	|
|	99	|	tBodyAccJerk-energy()-Z	|
|	100	|	tBodyAccJerk-iqr()-X	|
|	101	|	tBodyAccJerk-iqr()-Y	|
|	102	|	tBodyAccJerk-iqr()-Z	|
|	103	|	tBodyAccJerk-entropy()-X	|
|	104	|	tBodyAccJerk-entropy()-Y	|
|	105	|	tBodyAccJerk-entropy()-Z	|
|	106	|	tBodyAccJerk-arCoeff()-X,1	|
|	107	|	tBodyAccJerk-arCoeff()-X,2	|
|	108	|	tBodyAccJerk-arCoeff()-X,3	|
|	109	|	tBodyAccJerk-arCoeff()-X,4	|
|	110	|	tBodyAccJerk-arCoeff()-Y,1	|
|	111	|	tBodyAccJerk-arCoeff()-Y,2	|
|	112	|	tBodyAccJerk-arCoeff()-Y,3	|
|	113	|	tBodyAccJerk-arCoeff()-Y,4	|
|	114	|	tBodyAccJerk-arCoeff()-Z,1	|
|	115	|	tBodyAccJerk-arCoeff()-Z,2	|
|	116	|	tBodyAccJerk-arCoeff()-Z,3	|
|	117	|	tBodyAccJerk-arCoeff()-Z,4	|
|	118	|	tBodyAccJerk-correlation()-X,Y	|
|	119	|	tBodyAccJerk-correlation()-X,Z	|
|	120	|	tBodyAccJerk-correlation()-Y,Z	|
|	121	|	tBodyGyro-mean()-X	|
|	122	|	tBodyGyro-mean()-Y	|
|	123	|	tBodyGyro-mean()-Z	|
|	124	|	tBodyGyro-std()-X	|
|	125	|	tBodyGyro-std()-Y	|
|	126	|	tBodyGyro-std()-Z	|
|	127	|	tBodyGyro-mad()-X	|
|	128	|	tBodyGyro-mad()-Y	|
|	129	|	tBodyGyro-mad()-Z	|
|	130	|	tBodyGyro-max()-X	|
|	131	|	tBodyGyro-max()-Y	|
|	132	|	tBodyGyro-max()-Z	|
|	133	|	tBodyGyro-min()-X	|
|	134	|	tBodyGyro-min()-Y	|
|	135	|	tBodyGyro-min()-Z	|
|	136	|	tBodyGyro-sma()	|
|	137	|	tBodyGyro-energy()-X	|
|	138	|	tBodyGyro-energy()-Y	|
|	139	|	tBodyGyro-energy()-Z	|
|	140	|	tBodyGyro-iqr()-X	|
|	141	|	tBodyGyro-iqr()-Y	|
|	142	|	tBodyGyro-iqr()-Z	|
|	143	|	tBodyGyro-entropy()-X	|
|	144	|	tBodyGyro-entropy()-Y	|
|	145	|	tBodyGyro-entropy()-Z	|
|	146	|	tBodyGyro-arCoeff()-X,1	|
|	147	|	tBodyGyro-arCoeff()-X,2	|
|	148	|	tBodyGyro-arCoeff()-X,3	|
|	149	|	tBodyGyro-arCoeff()-X,4	|
|	150	|	tBodyGyro-arCoeff()-Y,1	|
|	151	|	tBodyGyro-arCoeff()-Y,2	|
|	152	|	tBodyGyro-arCoeff()-Y,3	|
|	153	|	tBodyGyro-arCoeff()-Y,4	|
|	154	|	tBodyGyro-arCoeff()-Z,1	|
|	155	|	tBodyGyro-arCoeff()-Z,2	|
|	156	|	tBodyGyro-arCoeff()-Z,3	|
|	157	|	tBodyGyro-arCoeff()-Z,4	|
|	158	|	tBodyGyro-correlation()-X,Y	|
|	159	|	tBodyGyro-correlation()-X,Z	|
|	160	|	tBodyGyro-correlation()-Y,Z	|
|	161	|	tBodyGyroJerk-mean()-X	|
|	162	|	tBodyGyroJerk-mean()-Y	|
|	163	|	tBodyGyroJerk-mean()-Z	|
|	164	|	tBodyGyroJerk-std()-X	|
|	165	|	tBodyGyroJerk-std()-Y	|
|	166	|	tBodyGyroJerk-std()-Z	|
|	167	|	tBodyGyroJerk-mad()-X	|
|	168	|	tBodyGyroJerk-mad()-Y	|
|	169	|	tBodyGyroJerk-mad()-Z	|
|	170	|	tBodyGyroJerk-max()-X	|
|	171	|	tBodyGyroJerk-max()-Y	|
|	172	|	tBodyGyroJerk-max()-Z	|
|	173	|	tBodyGyroJerk-min()-X	|
|	174	|	tBodyGyroJerk-min()-Y	|
|	175	|	tBodyGyroJerk-min()-Z	|
|	176	|	tBodyGyroJerk-sma()	|
|	177	|	tBodyGyroJerk-energy()-X	|
|	178	|	tBodyGyroJerk-energy()-Y	|
|	179	|	tBodyGyroJerk-energy()-Z	|
|	180	|	tBodyGyroJerk-iqr()-X	|
|	181	|	tBodyGyroJerk-iqr()-Y	|
|	182	|	tBodyGyroJerk-iqr()-Z	|
|	183	|	tBodyGyroJerk-entropy()-X	|
|	184	|	tBodyGyroJerk-entropy()-Y	|
|	185	|	tBodyGyroJerk-entropy()-Z	|
|	186	|	tBodyGyroJerk-arCoeff()-X,1	|
|	187	|	tBodyGyroJerk-arCoeff()-X,2	|
|	188	|	tBodyGyroJerk-arCoeff()-X,3	|
|	189	|	tBodyGyroJerk-arCoeff()-X,4	|
|	190	|	tBodyGyroJerk-arCoeff()-Y,1	|
|	191	|	tBodyGyroJerk-arCoeff()-Y,2	|
|	192	|	tBodyGyroJerk-arCoeff()-Y,3	|
|	193	|	tBodyGyroJerk-arCoeff()-Y,4	|
|	194	|	tBodyGyroJerk-arCoeff()-Z,1	|
|	195	|	tBodyGyroJerk-arCoeff()-Z,2	|
|	196	|	tBodyGyroJerk-arCoeff()-Z,3	|
|	197	|	tBodyGyroJerk-arCoeff()-Z,4	|
|	198	|	tBodyGyroJerk-correlation()-X,Y	|
|	199	|	tBodyGyroJerk-correlation()-X,Z	|
|	200	|	tBodyGyroJerk-correlation()-Y,Z	|
|	201	|	tBodyAccMag-mean()	|
|	202	|	tBodyAccMag-std()	|
|	203	|	tBodyAccMag-mad()	|
|	204	|	tBodyAccMag-max()	|
|	205	|	tBodyAccMag-min()	|
|	206	|	tBodyAccMag-sma()	|
|	207	|	tBodyAccMag-energy()	|
|	208	|	tBodyAccMag-iqr()	|
|	209	|	tBodyAccMag-entropy()	|
|	210	|	tBodyAccMag-arCoeff()1	|
|	211	|	tBodyAccMag-arCoeff()2	|
|	212	|	tBodyAccMag-arCoeff()3	|
|	213	|	tBodyAccMag-arCoeff()4	|
|	214	|	tGravityAccMag-mean()	|
|	215	|	tGravityAccMag-std()	|
|	216	|	tGravityAccMag-mad()	|
|	217	|	tGravityAccMag-max()	|
|	218	|	tGravityAccMag-min()	|
|	219	|	tGravityAccMag-sma()	|
|	220	|	tGravityAccMag-energy()	|
|	221	|	tGravityAccMag-iqr()	|
|	222	|	tGravityAccMag-entropy()	|
|	223	|	tGravityAccMag-arCoeff()1	|
|	224	|	tGravityAccMag-arCoeff()2	|
|	225	|	tGravityAccMag-arCoeff()3	|
|	226	|	tGravityAccMag-arCoeff()4	|
|	227	|	tBodyAccJerkMag-mean()	|
|	228	|	tBodyAccJerkMag-std()	|
|	229	|	tBodyAccJerkMag-mad()	|
|	230	|	tBodyAccJerkMag-max()	|
|	231	|	tBodyAccJerkMag-min()	|
|	232	|	tBodyAccJerkMag-sma()	|
|	233	|	tBodyAccJerkMag-energy()	|
|	234	|	tBodyAccJerkMag-iqr()	|
|	235	|	tBodyAccJerkMag-entropy()	|
|	236	|	tBodyAccJerkMag-arCoeff()1	|
|	237	|	tBodyAccJerkMag-arCoeff()2	|
|	238	|	tBodyAccJerkMag-arCoeff()3	|
|	239	|	tBodyAccJerkMag-arCoeff()4	|
|	240	|	tBodyGyroMag-mean()	|
|	241	|	tBodyGyroMag-std()	|
|	242	|	tBodyGyroMag-mad()	|
|	243	|	tBodyGyroMag-max()	|
|	244	|	tBodyGyroMag-min()	|
|	245	|	tBodyGyroMag-sma()	|
|	246	|	tBodyGyroMag-energy()	|
|	247	|	tBodyGyroMag-iqr()	|
|	248	|	tBodyGyroMag-entropy()	|
|	249	|	tBodyGyroMag-arCoeff()1	|
|	250	|	tBodyGyroMag-arCoeff()2	|
|	251	|	tBodyGyroMag-arCoeff()3	|
|	252	|	tBodyGyroMag-arCoeff()4	|
|	253	|	tBodyGyroJerkMag-mean()	|
|	254	|	tBodyGyroJerkMag-std()	|
|	255	|	tBodyGyroJerkMag-mad()	|
|	256	|	tBodyGyroJerkMag-max()	|
|	257	|	tBodyGyroJerkMag-min()	|
|	258	|	tBodyGyroJerkMag-sma()	|
|	259	|	tBodyGyroJerkMag-energy()	|
|	260	|	tBodyGyroJerkMag-iqr()	|
|	261	|	tBodyGyroJerkMag-entropy()	|
|	262	|	tBodyGyroJerkMag-arCoeff()1	|
|	263	|	tBodyGyroJerkMag-arCoeff()2	|
|	264	|	tBodyGyroJerkMag-arCoeff()3	|
|	265	|	tBodyGyroJerkMag-arCoeff()4	|
|	266	|	fBodyAcc-mean()-X	|
|	267	|	fBodyAcc-mean()-Y	|
|	268	|	fBodyAcc-mean()-Z	|
|	269	|	fBodyAcc-std()-X	|
|	270	|	fBodyAcc-std()-Y	|
|	271	|	fBodyAcc-std()-Z	|
|	272	|	fBodyAcc-mad()-X	|
|	273	|	fBodyAcc-mad()-Y	|
|	274	|	fBodyAcc-mad()-Z	|
|	275	|	fBodyAcc-max()-X	|
|	276	|	fBodyAcc-max()-Y	|
|	277	|	fBodyAcc-max()-Z	|
|	278	|	fBodyAcc-min()-X	|
|	279	|	fBodyAcc-min()-Y	|
|	280	|	fBodyAcc-min()-Z	|
|	281	|	fBodyAcc-sma()	|
|	282	|	fBodyAcc-energy()-X	|
|	283	|	fBodyAcc-energy()-Y	|
|	284	|	fBodyAcc-energy()-Z	|
|	285	|	fBodyAcc-iqr()-X	|
|	286	|	fBodyAcc-iqr()-Y	|
|	287	|	fBodyAcc-iqr()-Z	|
|	288	|	fBodyAcc-entropy()-X	|
|	289	|	fBodyAcc-entropy()-Y	|
|	290	|	fBodyAcc-entropy()-Z	|
|	291	|	fBodyAcc-maxInds-X	|
|	292	|	fBodyAcc-maxInds-Y	|
|	293	|	fBodyAcc-maxInds-Z	|
|	294	|	fBodyAcc-meanFreq()-X	|
|	295	|	fBodyAcc-meanFreq()-Y	|
|	296	|	fBodyAcc-meanFreq()-Z	|
|	297	|	fBodyAcc-skewness()-X	|
|	298	|	fBodyAcc-kurtosis()-X	|
|	299	|	fBodyAcc-skewness()-Y	|
|	300	|	fBodyAcc-kurtosis()-Y	|
|	301	|	fBodyAcc-skewness()-Z	|
|	302	|	fBodyAcc-kurtosis()-Z	|
|	303	|	fBodyAcc-bandsEnergy()-1,8	|
|	304	|	fBodyAcc-bandsEnergy()-9,16	|
|	305	|	fBodyAcc-bandsEnergy()-17,24	|
|	306	|	fBodyAcc-bandsEnergy()-25,32	|
|	307	|	fBodyAcc-bandsEnergy()-33,40	|
|	308	|	fBodyAcc-bandsEnergy()-41,48	|
|	309	|	fBodyAcc-bandsEnergy()-49,56	|
|	310	|	fBodyAcc-bandsEnergy()-57,64	|
|	311	|	fBodyAcc-bandsEnergy()-1,16	|
|	312	|	fBodyAcc-bandsEnergy()-17,32	|
|	313	|	fBodyAcc-bandsEnergy()-33,48	|
|	314	|	fBodyAcc-bandsEnergy()-49,64	|
|	315	|	fBodyAcc-bandsEnergy()-1,24	|
|	316	|	fBodyAcc-bandsEnergy()-25,48	|
|	317	|	fBodyAcc-bandsEnergy()-1,8	|
|	318	|	fBodyAcc-bandsEnergy()-9,16	|
|	319	|	fBodyAcc-bandsEnergy()-17,24	|
|	320	|	fBodyAcc-bandsEnergy()-25,32	|
|	321	|	fBodyAcc-bandsEnergy()-33,40	|
|	322	|	fBodyAcc-bandsEnergy()-41,48	|
|	323	|	fBodyAcc-bandsEnergy()-49,56	|
|	324	|	fBodyAcc-bandsEnergy()-57,64	|
|	325	|	fBodyAcc-bandsEnergy()-1,16	|
|	326	|	fBodyAcc-bandsEnergy()-17,32	|
|	327	|	fBodyAcc-bandsEnergy()-33,48	|
|	328	|	fBodyAcc-bandsEnergy()-49,64	|
|	329	|	fBodyAcc-bandsEnergy()-1,24	|
|	330	|	fBodyAcc-bandsEnergy()-25,48	|
|	331	|	fBodyAcc-bandsEnergy()-1,8	|
|	332	|	fBodyAcc-bandsEnergy()-9,16	|
|	333	|	fBodyAcc-bandsEnergy()-17,24	|
|	334	|	fBodyAcc-bandsEnergy()-25,32	|
|	335	|	fBodyAcc-bandsEnergy()-33,40	|
|	336	|	fBodyAcc-bandsEnergy()-41,48	|
|	337	|	fBodyAcc-bandsEnergy()-49,56	|
|	338	|	fBodyAcc-bandsEnergy()-57,64	|
|	339	|	fBodyAcc-bandsEnergy()-1,16	|
|	340	|	fBodyAcc-bandsEnergy()-17,32	|
|	341	|	fBodyAcc-bandsEnergy()-33,48	|
|	342	|	fBodyAcc-bandsEnergy()-49,64	|
|	343	|	fBodyAcc-bandsEnergy()-1,24	|
|	344	|	fBodyAcc-bandsEnergy()-25,48	|
|	345	|	fBodyAccJerk-mean()-X	|
|	346	|	fBodyAccJerk-mean()-Y	|
|	347	|	fBodyAccJerk-mean()-Z	|
|	348	|	fBodyAccJerk-std()-X	|
|	349	|	fBodyAccJerk-std()-Y	|
|	350	|	fBodyAccJerk-std()-Z	|
|	351	|	fBodyAccJerk-mad()-X	|
|	352	|	fBodyAccJerk-mad()-Y	|
|	353	|	fBodyAccJerk-mad()-Z	|
|	354	|	fBodyAccJerk-max()-X	|
|	355	|	fBodyAccJerk-max()-Y	|
|	356	|	fBodyAccJerk-max()-Z	|
|	357	|	fBodyAccJerk-min()-X	|
|	358	|	fBodyAccJerk-min()-Y	|
|	359	|	fBodyAccJerk-min()-Z	|
|	360	|	fBodyAccJerk-sma()	|
|	361	|	fBodyAccJerk-energy()-X	|
|	362	|	fBodyAccJerk-energy()-Y	|
|	363	|	fBodyAccJerk-energy()-Z	|
|	364	|	fBodyAccJerk-iqr()-X	|
|	365	|	fBodyAccJerk-iqr()-Y	|
|	366	|	fBodyAccJerk-iqr()-Z	|
|	367	|	fBodyAccJerk-entropy()-X	|
|	368	|	fBodyAccJerk-entropy()-Y	|
|	369	|	fBodyAccJerk-entropy()-Z	|
|	370	|	fBodyAccJerk-maxInds-X	|
|	371	|	fBodyAccJerk-maxInds-Y	|
|	372	|	fBodyAccJerk-maxInds-Z	|
|	373	|	fBodyAccJerk-meanFreq()-X	|
|	374	|	fBodyAccJerk-meanFreq()-Y	|
|	375	|	fBodyAccJerk-meanFreq()-Z	|
|	376	|	fBodyAccJerk-skewness()-X	|
|	377	|	fBodyAccJerk-kurtosis()-X	|
|	378	|	fBodyAccJerk-skewness()-Y	|
|	379	|	fBodyAccJerk-kurtosis()-Y	|
|	380	|	fBodyAccJerk-skewness()-Z	|
|	381	|	fBodyAccJerk-kurtosis()-Z	|
|	382	|	fBodyAccJerk-bandsEnergy()-1,8	|
|	383	|	fBodyAccJerk-bandsEnergy()-9,16	|
|	384	|	fBodyAccJerk-bandsEnergy()-17,24	|
|	385	|	fBodyAccJerk-bandsEnergy()-25,32	|
|	386	|	fBodyAccJerk-bandsEnergy()-33,40	|
|	387	|	fBodyAccJerk-bandsEnergy()-41,48	|
|	388	|	fBodyAccJerk-bandsEnergy()-49,56	|
|	389	|	fBodyAccJerk-bandsEnergy()-57,64	|
|	390	|	fBodyAccJerk-bandsEnergy()-1,16	|
|	391	|	fBodyAccJerk-bandsEnergy()-17,32	|
|	392	|	fBodyAccJerk-bandsEnergy()-33,48	|
|	393	|	fBodyAccJerk-bandsEnergy()-49,64	|
|	394	|	fBodyAccJerk-bandsEnergy()-1,24	|
|	395	|	fBodyAccJerk-bandsEnergy()-25,48	|
|	396	|	fBodyAccJerk-bandsEnergy()-1,8	|
|	397	|	fBodyAccJerk-bandsEnergy()-9,16	|
|	398	|	fBodyAccJerk-bandsEnergy()-17,24	|
|	399	|	fBodyAccJerk-bandsEnergy()-25,32	|
|	400	|	fBodyAccJerk-bandsEnergy()-33,40	|
|	401	|	fBodyAccJerk-bandsEnergy()-41,48	|
|	402	|	fBodyAccJerk-bandsEnergy()-49,56	|
|	403	|	fBodyAccJerk-bandsEnergy()-57,64	|
|	404	|	fBodyAccJerk-bandsEnergy()-1,16	|
|	405	|	fBodyAccJerk-bandsEnergy()-17,32	|
|	406	|	fBodyAccJerk-bandsEnergy()-33,48	|
|	407	|	fBodyAccJerk-bandsEnergy()-49,64	|
|	408	|	fBodyAccJerk-bandsEnergy()-1,24	|
|	409	|	fBodyAccJerk-bandsEnergy()-25,48	|
|	410	|	fBodyAccJerk-bandsEnergy()-1,8	|
|	411	|	fBodyAccJerk-bandsEnergy()-9,16	|
|	412	|	fBodyAccJerk-bandsEnergy()-17,24	|
|	413	|	fBodyAccJerk-bandsEnergy()-25,32	|
|	414	|	fBodyAccJerk-bandsEnergy()-33,40	|
|	415	|	fBodyAccJerk-bandsEnergy()-41,48	|
|	416	|	fBodyAccJerk-bandsEnergy()-49,56	|
|	417	|	fBodyAccJerk-bandsEnergy()-57,64	|
|	418	|	fBodyAccJerk-bandsEnergy()-1,16	|
|	419	|	fBodyAccJerk-bandsEnergy()-17,32	|
|	420	|	fBodyAccJerk-bandsEnergy()-33,48	|
|	421	|	fBodyAccJerk-bandsEnergy()-49,64	|
|	422	|	fBodyAccJerk-bandsEnergy()-1,24	|
|	423	|	fBodyAccJerk-bandsEnergy()-25,48	|
|	424	|	fBodyGyro-mean()-X	|
|	425	|	fBodyGyro-mean()-Y	|
|	426	|	fBodyGyro-mean()-Z	|
|	427	|	fBodyGyro-std()-X	|
|	428	|	fBodyGyro-std()-Y	|
|	429	|	fBodyGyro-std()-Z	|
|	430	|	fBodyGyro-mad()-X	|
|	431	|	fBodyGyro-mad()-Y	|
|	432	|	fBodyGyro-mad()-Z	|
|	433	|	fBodyGyro-max()-X	|
|	434	|	fBodyGyro-max()-Y	|
|	435	|	fBodyGyro-max()-Z	|
|	436	|	fBodyGyro-min()-X	|
|	437	|	fBodyGyro-min()-Y	|
|	438	|	fBodyGyro-min()-Z	|
|	439	|	fBodyGyro-sma()	|
|	440	|	fBodyGyro-energy()-X	|
|	441	|	fBodyGyro-energy()-Y	|
|	442	|	fBodyGyro-energy()-Z	|
|	443	|	fBodyGyro-iqr()-X	|
|	444	|	fBodyGyro-iqr()-Y	|
|	445	|	fBodyGyro-iqr()-Z	|
|	446	|	fBodyGyro-entropy()-X	|
|	447	|	fBodyGyro-entropy()-Y	|
|	448	|	fBodyGyro-entropy()-Z	|
|	449	|	fBodyGyro-maxInds-X	|
|	450	|	fBodyGyro-maxInds-Y	|
|	451	|	fBodyGyro-maxInds-Z	|
|	452	|	fBodyGyro-meanFreq()-X	|
|	453	|	fBodyGyro-meanFreq()-Y	|
|	454	|	fBodyGyro-meanFreq()-Z	|
|	455	|	fBodyGyro-skewness()-X	|
|	456	|	fBodyGyro-kurtosis()-X	|
|	457	|	fBodyGyro-skewness()-Y	|
|	458	|	fBodyGyro-kurtosis()-Y	|
|	459	|	fBodyGyro-skewness()-Z	|
|	460	|	fBodyGyro-kurtosis()-Z	|
|	461	|	fBodyGyro-bandsEnergy()-1,8	|
|	462	|	fBodyGyro-bandsEnergy()-9,16	|
|	463	|	fBodyGyro-bandsEnergy()-17,24	|
|	464	|	fBodyGyro-bandsEnergy()-25,32	|
|	465	|	fBodyGyro-bandsEnergy()-33,40	|
|	466	|	fBodyGyro-bandsEnergy()-41,48	|
|	467	|	fBodyGyro-bandsEnergy()-49,56	|
|	468	|	fBodyGyro-bandsEnergy()-57,64	|
|	469	|	fBodyGyro-bandsEnergy()-1,16	|
|	470	|	fBodyGyro-bandsEnergy()-17,32	|
|	471	|	fBodyGyro-bandsEnergy()-33,48	|
|	472	|	fBodyGyro-bandsEnergy()-49,64	|
|	473	|	fBodyGyro-bandsEnergy()-1,24	|
|	474	|	fBodyGyro-bandsEnergy()-25,48	|
|	475	|	fBodyGyro-bandsEnergy()-1,8	|
|	476	|	fBodyGyro-bandsEnergy()-9,16	|
|	477	|	fBodyGyro-bandsEnergy()-17,24	|
|	478	|	fBodyGyro-bandsEnergy()-25,32	|
|	479	|	fBodyGyro-bandsEnergy()-33,40	|
|	480	|	fBodyGyro-bandsEnergy()-41,48	|
|	481	|	fBodyGyro-bandsEnergy()-49,56	|
|	482	|	fBodyGyro-bandsEnergy()-57,64	|
|	483	|	fBodyGyro-bandsEnergy()-1,16	|
|	484	|	fBodyGyro-bandsEnergy()-17,32	|
|	485	|	fBodyGyro-bandsEnergy()-33,48	|
|	486	|	fBodyGyro-bandsEnergy()-49,64	|
|	487	|	fBodyGyro-bandsEnergy()-1,24	|
|	488	|	fBodyGyro-bandsEnergy()-25,48	|
|	489	|	fBodyGyro-bandsEnergy()-1,8	|
|	490	|	fBodyGyro-bandsEnergy()-9,16	|
|	491	|	fBodyGyro-bandsEnergy()-17,24	|
|	492	|	fBodyGyro-bandsEnergy()-25,32	|
|	493	|	fBodyGyro-bandsEnergy()-33,40	|
|	494	|	fBodyGyro-bandsEnergy()-41,48	|
|	495	|	fBodyGyro-bandsEnergy()-49,56	|
|	496	|	fBodyGyro-bandsEnergy()-57,64	|
|	497	|	fBodyGyro-bandsEnergy()-1,16	|
|	498	|	fBodyGyro-bandsEnergy()-17,32	|
|	499	|	fBodyGyro-bandsEnergy()-33,48	|
|	500	|	fBodyGyro-bandsEnergy()-49,64	|
|	501	|	fBodyGyro-bandsEnergy()-1,24	|
|	502	|	fBodyGyro-bandsEnergy()-25,48	|
|	503	|	fBodyAccMag-mean()	|
|	504	|	fBodyAccMag-std()	|
|	505	|	fBodyAccMag-mad()	|
|	506	|	fBodyAccMag-max()	|
|	507	|	fBodyAccMag-min()	|
|	508	|	fBodyAccMag-sma()	|
|	509	|	fBodyAccMag-energy()	|
|	510	|	fBodyAccMag-iqr()	|
|	511	|	fBodyAccMag-entropy()	|
|	512	|	fBodyAccMag-maxInds	|
|	513	|	fBodyAccMag-meanFreq()	|
|	514	|	fBodyAccMag-skewness()	|
|	515	|	fBodyAccMag-kurtosis()	|
|	516	|	fBodyBodyAccJerkMag-mean()	|
|	517	|	fBodyBodyAccJerkMag-std()	|
|	518	|	fBodyBodyAccJerkMag-mad()	|
|	519	|	fBodyBodyAccJerkMag-max()	|
|	520	|	fBodyBodyAccJerkMag-min()	|
|	521	|	fBodyBodyAccJerkMag-sma()	|
|	522	|	fBodyBodyAccJerkMag-energy()	|
|	523	|	fBodyBodyAccJerkMag-iqr()	|
|	524	|	fBodyBodyAccJerkMag-entropy()	|
|	525	|	fBodyBodyAccJerkMag-maxInds	|
|	526	|	fBodyBodyAccJerkMag-meanFreq()	|
|	527	|	fBodyBodyAccJerkMag-skewness()	|
|	528	|	fBodyBodyAccJerkMag-kurtosis()	|
|	529	|	fBodyBodyGyroMag-mean()	|
|	530	|	fBodyBodyGyroMag-std()	|
|	531	|	fBodyBodyGyroMag-mad()	|
|	532	|	fBodyBodyGyroMag-max()	|
|	533	|	fBodyBodyGyroMag-min()	|
|	534	|	fBodyBodyGyroMag-sma()	|
|	535	|	fBodyBodyGyroMag-energy()	|
|	536	|	fBodyBodyGyroMag-iqr()	|
|	537	|	fBodyBodyGyroMag-entropy()	|
|	538	|	fBodyBodyGyroMag-maxInds	|
|	539	|	fBodyBodyGyroMag-meanFreq()	|
|	540	|	fBodyBodyGyroMag-skewness()	|
|	541	|	fBodyBodyGyroMag-kurtosis()	|
|	542	|	fBodyBodyGyroJerkMag-mean()	|
|	543	|	fBodyBodyGyroJerkMag-std()	|
|	544	|	fBodyBodyGyroJerkMag-mad()	|
|	545	|	fBodyBodyGyroJerkMag-max()	|
|	546	|	fBodyBodyGyroJerkMag-min()	|
|	547	|	fBodyBodyGyroJerkMag-sma()	|
|	548	|	fBodyBodyGyroJerkMag-energy()	|
|	549	|	fBodyBodyGyroJerkMag-iqr()	|
|	550	|	fBodyBodyGyroJerkMag-entropy()	|
|	551	|	fBodyBodyGyroJerkMag-maxInds	|
|	552	|	fBodyBodyGyroJerkMag-meanFreq()	|
|	553	|	fBodyBodyGyroJerkMag-skewness()	|
|	554	|	fBodyBodyGyroJerkMag-kurtosis()	|
|	555	|	angle(tBodyAccMean,gravity)	|
|	556	|	angle(tBodyAccJerkMean),gravityMean)	|
|	557	|	angle(tBodyGyroMean,gravityMean)	|
|	558	|	angle(tBodyGyroJerkMean,gravityMean)	|
|	559	|	angle(X,gravityMean)	|
|	560	|	angle(Y,gravityMean)	|
|	561	|	angle(Z,gravityMean)	|

