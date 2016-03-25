

## Step 1 : Merge the training and test sets to create one data set
library(plyr)
## Loading Data
Xtrain <- read.table("./Desktop/X_train.txt")
Ytrain <- read.table("./Desktop/y_train.txt")
subtrain <- read.table("./Desktop/subject_train.txt")

Xtest <- read.table("Desktop/X_test.txt")
Ytest <- read.table("Desktop/y_test.txt")
subtest <- read.table("Desktop/subject_test.txt")

## creating "Xdata", "Ydata" and "subdata" data set
Xdata <- rbind(Xtrain, Xtest)
Ydata <- rbind(Ytrain, Ytest)
subdata <- rbind(subtrain, subtest) 

## Step 2 :Extracting only the measurements on the mean and standard deviation for each measurement

features <- read.table("./Desktop/features.txt")

## extracting only columns with mean()|std() with their names
MSD <- grep("-(mean|std)\\(\\)", features[, 2])

## Subsetting 
Xdata <- Xdata[, MSD]

##correcting the column names
names(Xdata) <- features[MSD, 2]

## Step 3 :Using descriptive activity names to name the activities in the data set
activities <- read.table("./Desktop/activity_labels.txt")

## updating the values with correct activity names
Ydata[, 1] <- activities[Ydata[, 1], 2]

## correcting column name to activity
names(Ydata) <- "activity"

## Step 4:  Appropriately label the data set with descriptive variable names

## correctting column name to subject
names(subdata) <- "subject"

## Columnbinding data in "all"
all<- cbind(Xdata, Ydata, subdata)

## Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject

avg_data <- ddply(all, .(subject, activity), function(x) colMeans(x[, 1:66])) 

write.table(avg_data, "averages_data.txt", row.name=FALSE)
