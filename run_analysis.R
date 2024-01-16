# Load required libraries
library(dplyr)

# Download the dataset and unzip it
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, destfile = "dataset.zip")
unzip("dataset.zip")

# Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "feature_name"))

# Load and merge test datasets
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")

test_data <- cbind(test_subjects, test_y, test_x)

# Load and merge train datasets
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")

train_data <- cbind(train_subjects, train_y, train_x)

# Merge train and test data sets
merged_data <- rbind(train_data, test_data)

# Extract measurements on the mean and standard deviation for each measurement
extracted_data <- merged_data %>% select(subject, activity_id, contains("mean"), contains("std"))

# Replace activity_id with descriptive activity names
extracted_data <- merge(extracted_data, activity_labels, by.x = "activity_id", by.y = "id") %>% 
  select(-activity_id, activity = activity)

# Appropriately label the data set with descriptive variable names
# You would need to implement more specific replacements based on your understanding of the feature_info.txt file
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))

# From the data set, creates a second tidy data set
# with the average of each variable for each activity and each subject
tidy_data <- extracted_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Write the tidy data set to a file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)