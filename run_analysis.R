## Data Science Specialization - Getting and Cleaning Data
## WEEK 4 PROGRAMMING ASSIGNMENT
## Author: Justyna Pawlata
## Date: Dec 8, 2017

# Import script with functions
source("./run_analysis_func.R")

# Folder with unzipped data files
folder_path <- "./data/UCI-HAR-Dataset/"

# Read all files
# Use function from the additional file
activity_labels <- read_file(folder_path, "activity_labels.txt", FALSE)
features <- read_file(folder_path, "features.txt", FALSE)
# Test files
x_test <- read_file(folder_path, "test/X_test.txt", FALSE)
y_test <- read_file(folder_path, "test/y_test.txt", FALSE)
subject_test <- read_file(folder_path, "test/subject_test.txt", FALSE)
# Train files
x_train <- read_file(folder_path, "train/X_train.txt", FALSE)
y_train <- read_file(folder_path, "train/y_train.txt", FALSE)
subject_train <- read_file(folder_path, "train/subject_train.txt", FALSE)

# Add proper variable's names
names(activity_labels) <- c("id", "activity")
names(features) <- c("id", "feature")


# 1. Merges the training and the test sets to create one data set 

# Use function from the additional file
x_all <- merge_data(x_train, x_test)
y_all <- merge_data(y_train, y_test)
subject_all <- merge_data(subject_train, subject_test)
# Set variables' names (we'll set variables for x_all dataset later)
names(y_all) <- c("activity_id")
names(subject_all) <- c("subject_id")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

names(x_all) <- features$feature #variables' names based on features
extract <- grep("(mean|std)", features$feature) #look for mean or std
data_extracted <- x_all[extract] #dataset with mean and std only


# 3. Uses descriptive activity names to name the activities in the data set

# Bind x, y and subject datasets to get one dataset with all information
data_all <- cbind(data_extracted, y_all, subject_all)
# Merge new dataset with activity labels
merged <- merge(data_all, activity_labels, by.x = "activity_id", by.y = "id")
mergedDF <- merged[,c(2:82, 1)] # Move first column at the end of the dataset, just to improve readability


# 4. Appropriately labels the data set with descriptive variable names

# Use dplyr library to use pipeline
library(dplyr)
colnames <- names(mergedDF)
# Lower all characters, remove '_', '()', put '-' instead of ',', remove doubled 'body' text
colnames <- tolower(colnames) %>% {gsub("_", "", .)} %>% {gsub(",", "-", .)} %>% {gsub("[()]", "", .)} %>% {gsub("bodybody", "body", .)}
names(mergedDF) <- colnames # use new colnames as a variables


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

# Group dataset by subjectid, activity (list all activities for each subject)
# Compute mean for grouped data (removing NAs)
avgdata <- mergedDF %>% group_by(subjectid, activity) %>% summarise_all(funs(mean(., na.rm = TRUE)))
# Save sataset as a txt
write.table(avgdata, "./data/finaldata.txt", row.name=FALSE)