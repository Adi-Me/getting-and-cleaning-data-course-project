if("dplyr" %in% rownames(installed.packages()) == FALSE){
    install.packages("dplyr")
}

if(!file.exists("UCI HAR Dataset")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method = "curl")
    unzip("dataset.zip")
}

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"), train)

test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/test/y_test.txt"), test)

tidy <- rbind(test, train)

features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
features <- c("subject", "activity", features)
names(tidy) <- features

columns <- grep(".*mean\\(.*|.*std.*", features)
columns <- c(1, 2, columns)
tidy <- tidy[, columns]

activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
tidy$activity <- factor(tidy$activity, levels = activity[,1], labels = activity[,2])

library(dplyr)
summarize <- tidy %>% group_by(subject, activity) %>% summarize_each(funs(mean))

write.table(summarize, file = "tide.txt", row.name=FALSE)
