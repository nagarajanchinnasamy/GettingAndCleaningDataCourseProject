# Background #

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

Towards this, its important for these wearables to be able to recognize the activities performed by the users. One of the experiments conducted to gather data from the accelerometers from the Samsung Galaxy S smartphone is described at this site: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data collected by this experiment is available at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The goal of this project is to prepare independent tidy data set with the average of each variable for each activity and each subject to be able to use it for later analysis.

# Code Book #

Code Book explains the components of tidy data set and the transformations performed on the original dataset. It can be accessed [from here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/CodeBook.md)

# Analysis Script (run_analysis.R) #

Transformations performed on original data set are programmed in an R script named  [run_analysis.R](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/run_analysis.R). To run this script:

1. Extract the original data set to a folder (E.g., .../getdata-projectfiles-UCI HAR Dataset)
2. Copy run_analysis.R script inside the folder where original data was extracted to (E.g., .../getdata-projectfiles-UCI HAR Dataset)
3. Execute run_analysis.R script.

# Tidy Data #

Tidy data obtained after applying transformations is made [available here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/tidy_data.txt)

--------------

