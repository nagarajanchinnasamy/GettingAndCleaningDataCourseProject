library("plyr")
library("dplyr")

# set working dir
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)

# read activities (both code and descriptive)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("id", "name"));

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
tidy_data <- data %>%
  group_by(ActivityName, Subject) %>%
    summarise_each(funs(mean), 3:69)

# write into file
write.table(tidy_data, file="tidy_data.txt", row.names=FALSE)
