# Source Data #

To prepare the end result of this project, the source data was obtained from "Human Activity Recognition Using Smartphones Data Set" that was gathered through an experiment [described  here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Data gathered through this experiment can be downloaded [from here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Contents of this package (.zip) are explained in the Readme.txt file contained in the package and is made [available here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/UCI%20HAR%20Dataset/README.txt).  

Set of files that are relevant for this course project are available [here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/UCI%20HAR%20Dataset)

# Goal of this course project dataset #
To prepare a tidy dataset that:

- Combines both training and test datasets
- extracts only the variables of the mean and standard deviation for each measurement
- filnally provides the average of each variable for each activity and each subject

# Variables #

Each record in the final cleaned up data set contain the following variables:

### ActivityName ###
### Subject ###
### SetType ###
### Measure Variables ###
Totally 66 measure variables that show the average of each extracted variable grouped by each activity and each subject (E.g.: TimeBodyAcc_mean_X, TimeBodyAcc_mean_Y etc.).

# Cleaned up data #

The cleaned up data can be accessed [from here](https://github.com/nagarajanchinnasamy/GettingAndCleaningDataCourseProject/blob/master/tidy_data.txt).


# Transformation / Cleanup steps carried out #

1. From both, training and test samples, extracted only the variables of mean and standard deviation of measures
2. Associated each measure row with their corresponding descriptive Activity code and Subject Identifier.
3. Merged the training and test samples
4. On merged data, derived the tidy data set that is grouped by Activity, sub-grouped by Subject and the measures of averaged.
5. The tidy data set variable names are made more descriptive by replacing "t" with Time, "f" with Freq etc.
 



# read features (column names) and prepare descriptive version
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("id", "name"));
features_desc <- gsub("[_]+", "_", gsub("\\(\\)", "_",
    gsub("[ ]+", " ",
      gsub("[ ]*-[ ]*", "_",
        gsub("[ ]*tBody[ ]*", "TimeBody",
          gsub("[ ]*fBody[ ]*", "FreqBody",
            gsub("BodyBody", "Body",
              gsub ("^f", "Freq",
                gsub("^t", "Time", features$name)))))))))


# pick only columns where mean() and std() are applied
mean_std_features = grep("(mean\\(\\)|std\\(\\))", features$name, value = FALSE)


# read mean() and std() measures of training data and add Activity & Subject columns
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, colClasses="numeric", col.names=features_desc);
train_x <- subset(train_x, select=mean_std_features)
XActivity <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names=c("Activity"));
XSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, colClasses="numeric", col.names=c("Subject"));
train_x <- cbind(XActivity, XSubject, train_x)

# read mean() and std() measures of test data and add Activity & Subject columns
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, colClasses="numeric", col.names=features_desc);
test_x <- subset(test_x, select=mean_std_features)
XActivity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names=c("Activity"));
XSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, colClasses="numeric", col.names=c("Subject"));
test_x <- cbind(XActivity, XSubject, test_x)

# merge training and test samples
data <- rbind(train_x, test_x)

# add descriptive activity names
ActivityName <- activities$name[mapvalues(data$Activity, activities$id, activities$name, warn_missing = FALSE)]
data <- cbind(data, ActivityName)

# prepare final tidy dataset
