# Source Data #

To prepare the end result of this project, the source data was obtained from "Human Activity Recognition Using Smartphones Data Set" that was gathered through an experiment [described  here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Data gathered through this experiment can be downloaded [from here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Contents of this package (.zip) are explained in the Readme.txt file contained in the package and is made [available here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/UCI%20HAR%20Dataset/README.txt).  

Set of files that are relevant for this course project are available [here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/UCI%20HAR%20Dataset)

# Goal of tidy dataset #

Goal is to prepare a tidy dataset that:

- Combines both training and test datasets
- extracts only the variables of the mean and standard deviation for each measurement
- filnally provides the average of each variable for each activity and each subject

# Variables #

Each record in the final cleaned up data set contain the following variables:

#### ActivityName ####
Indicates the activity recognized as performed by the subject. It takes one of the following values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

#### Subject ####
Numerical identifier that unquely identifies a subject.

#### Measure Variables ####
Totally 66 numerical measure variables that show the average of each extracted variable grouped by each activity and each subject. E.g.: TimeBodyAcc_mean_X, TimeBodyAcc_mean_Y etc. For explanations on these variables, please refer to [README file of original data set](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/README.md)

# Tidy data #

The tidy data obtained by applying transformations / cleanup steps can be accessed [from here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/tidy_data.txt).


# Transformation / Cleanup steps carried out #

1. From both, training and test samples, extracted only the variables of mean and standard deviation of measures
2. Associated each measure row with their corresponding descriptive Activity code and Subject Identifier.
3. Merged the training and test samples
4. On merged data, derived the tidy data set that is grouped by Activity, sub-grouped by Subject and the measures of averaged.
5. The tidy data set variable names are made more descriptive by replacing "t" with Time, "f" with Freq etc.

--------------------
