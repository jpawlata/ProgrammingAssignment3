# CodeBook for the Course Project

## Dataset contains:

* **activity_labels.txt** - links the activity ID with their activity name
* **features.txt** - list of all features
* **features_info.txt** - shows information about the variables used on the feature vector
* **README.txt** - info file
* **test/subject_test.txt** - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
* **test/X_test.txt** - test set
* **test/y_test.txt** - test labels
* **train/subject_train.txt** - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
* **train/X_train.txt** - training set
* **train/y_train.txt** - training labels

(All files are in txt format)

## Dataset's variables

### activity_labels:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

### subject:
subject table contains ids (from 1 to 30)

### x_all:
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tBodyAcc-mad()-X
tBodyAcc-mad()-Y
tBodyAcc-mad()-Z
tBodyAcc-max()-X
tBodyAcc-max()-Y e.t.c
(data measured during the experiment)

## *run_analysis.R* script - variables

All variables used in the script:

* **folder_path** - directory with data files
* **activity_labels** - data from the *activity_labels.txt* file
* **features** - data from the *features.txt* file
* **x_test** - data from the *X_test.txt* file
* **y_test** - data from the *y_test.txt* file
* **subject_test** - data from the *subject_test.txt* file
* **x_train** - data from the *X_train.txt* file
* **y_train** - data from the *y_train.txt* file
* **subject_train** - data from the *subject_train.txt* file
* **x_all** - data from *x_test* and *x_train* joined
* **y_all** - data from *y_test* and *y_train* joined
* **subject_all** - data from *subject_test* and *subject_train* joined
* **extract** - number of columns with mean or std
* **data_extracted** - dataset with mean or std only
* **data_all** - *x_all*, *y_all*, *subject_all* joined
* **merged** - *data_all* merged with *activity_labels* by *activity_id*
* **mergedDF** - first column of the dataset moved at the end, improves readability
* **colnames** - *mergedDF* variables' names
* **avgdata** - average of each variable for each activity and each subject from *mergedDF*


## *run_analysis.R* script - steps done

Here you can find all steps I've taken to collect, tidy and analyse given data:

1. set *folder_path*
2. read txt files into variables
3. set variables' names for *activity_labels* and *features*
4. merge training sets with test sets for *x*, *y* and *subject* data
5. set variables' names for *y_all*, *subject_all* and *x_all*
6. look for variables with mean or std
7. create dataset with extracted variables only
8. combine *x_all*, *y_all* and *subject_all* to get one dataset with all information
9. merge created dataset with *activity_labels* by *activity_id*
10. create *mergedDF* dataset with first column moved at the end (improves readability)
11. update variables' names (lowercase, remove commas, remove doubled text etc.)
12. group *mergedDF* by subjectid and activity, compute mean for grouped data
13. create new *finaldata.txt* file

## Functions included in *run_analysis_func.R* script

### read_file()
Function reads a file using *read.table()* function.
It takes 3 arguments:
* **directory** - folder with data files (e.g. *"./data/UCI-HAR-Dataset/"*)
* **filepath** - subfolder with the filename (e.g.*"test/y_test.txt"*)
* **header** - if file contains the names of the variables in the first row (logical value, *TRUE/FALSE*)

### merge_data()
Function checks if both datasets have the same number of variables. Is so, joins both datasets using *rbind()* function. If not, stops the script and gives an error. It takes 2 arguments:
* **data1** - first dataset
* **data2** - second dataset
