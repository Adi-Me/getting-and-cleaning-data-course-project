# README



### Preparations

Check existance and install dplyr package:

```r
if("dplyr" %in% rownames(installed.packages()) == FALSE){
    install.packages("dplyr")
}
```

Check existanse and download data:

```r
if(!file.exists("UCI HAR Dataset")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method = "curl")
    unzip("dataset.zip")
}
```

### Read data from files

##### Read train data

```r
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
```

Add subject and activity data

```r
train <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"), train)
```

##### Read test data

```r
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
```

Add subject and activity data

```r
test <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/test/y_test.txt"), test)
```

### Merge the training and the test sets to create one data set

```r
tidy <- rbind(test, train)
```

### Appropriately labels the data set with descriptive variable names

```r
features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
features <- c("subject", "activity", features)
names(tidy) <- features
```

### Extract only the measurements on the mean and standard deviation for each measurement
Get the indexes of the relevant columns (columns contains "mean()" or "std()")

```r
columns <- grep(".*mean\\(.*|.*std.*", features)
```
Extract relevant columns (includes the subject and activity)

```r
columns <- c(as.integer(c(1, 2)), columns)
tidy <- tidy[, columns]
```

### Use descriptive activity names to name the activities in the data set
Get activity labels

```r
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
```
Edit activity column in dataset

```r
tidy$activity <- factor(tidy$activity, levels = activity[,1], labels = activity[,2])
```

### Create a second, independent tidy data set with the average of each variable for each activity and each subject
Group the data by subject and activity and than summarize

```r
library(dplyr)
summarize <- tidy %>% group_by(subject, activity) %>% summarize_each(funs(mean))
```

### Export the data as .txt file

```r
write.table(summarize, file = "tidy.txt", row.name=FALSE)
```
