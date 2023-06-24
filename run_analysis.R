
if (!file.exists('./data')){dir.create('./data')}

# Download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "./data/UCI_HAR_Dataset.zip"
download.file(url, destfile = zipfile)
unzip(zipfile, exdir = './data')


library(dplyr)

#Read the training data

subjectTrain = read.table('./data/UCI HAR Dataset/train/subject_train.txt')
trainX = read.table('./data/UCI HAR Dataset/train/X_train.txt')
trainY = read.table('./data/UCI HAR Dataset/train/Y_train.txt')

#Read the test data

subjectTest = read.table('./data/UCI HAR Dataset/test/subject_test.txt')
testX = read.table('./data/UCI HAR Dataset/test/X_test.txt')
testY = read.table('./data/UCI HAR Dataset/test/Y_test.txt')

#Merge the data

mergedSubjects = rbind(subjectTrain, subjectTest)
mergedFeatures = rbind(trainX,testX)
mergedActivities = rbind(trainY,testY)

#Read the feature names and extracting mean and standart dev. measuremetns
features = read.table('./data/UCI HAR Dataset/features.txt')
meanStdCols = grep('mean\\(\\)|std\\(\\)',features$V2)
mergedFeatures = mergedFeatures[, meanStdCols]

# Using descriptive acvtiviy names
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
mergedActivities$V1 = factor(mergedActivities$V1, levels = activityLabels$V1, labels = activityLabels$V2)

# Appropriately labeling the data set
colnames(mergedFeatures) = features[meanStdCols,2]

# Creating a tidy data set with the averages

tidyData = mergedFeatures %>%
        group_by(Activity = mergedActivities$V1, Subject = mergedSubjects$V1) %>%
        summarise_all(mean)

# Write the tidy data set to a file
write.table(tidyData, "tidy_data.txt", row.names = FALSE)

