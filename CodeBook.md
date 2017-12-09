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
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### subject:
subject table contains an id of each volunteer (number from 1 to 30)

### x_all:
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tBodyAcc-mad()-X
* tBodyAcc-mad()-Y
* tBodyAcc-mad()-Z
* tBodyAcc-max()-X
* tBodyAcc-max()-Y 
* e.t.c
(data measured during the experiment)

New dataset contnains variables limited to means and stds only:

```names(avgdata)```:
```
 [1] "subjectid"                 "activity"                  "tbodyacc-mean-x"           "tbodyacc-mean-y"          
 [5] "tbodyacc-mean-z"           "tbodyacc-std-x"            "tbodyacc-std-y"            "tbodyacc-std-z"           
 [9] "tgravityacc-mean-x"        "tgravityacc-mean-y"        "tgravityacc-mean-z"        "tgravityacc-std-x"        
[13] "tgravityacc-std-y"         "tgravityacc-std-z"         "tbodyaccjerk-mean-x"       "tbodyaccjerk-mean-y"      
[17] "tbodyaccjerk-mean-z"       "tbodyaccjerk-std-x"        "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"       
[21] "tbodygyro-mean-x"          "tbodygyro-mean-y"          "tbodygyro-mean-z"          "tbodygyro-std-x"          
[25] "tbodygyro-std-y"           "tbodygyro-std-z"           "tbodygyrojerk-mean-x"      "tbodygyrojerk-mean-y"     
[29] "tbodygyrojerk-mean-z"      "tbodygyrojerk-std-x"       "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"      
[33] "tbodyaccmag-mean"          "tbodyaccmag-std"           "tgravityaccmag-mean"       "tgravityaccmag-std"       
[37] "tbodyaccjerkmag-mean"      "tbodyaccjerkmag-std"       "tbodygyromag-mean"         "tbodygyromag-std"         
[41] "tbodygyrojerkmag-mean"     "tbodygyrojerkmag-std"      "fbodyacc-mean-x"           "fbodyacc-mean-y"          
[45] "fbodyacc-mean-z"           "fbodyacc-std-x"            "fbodyacc-std-y"            "fbodyacc-std-z"           
[49] "fbodyacc-meanfreq-x"       "fbodyacc-meanfreq-y"       "fbodyacc-meanfreq-z"       "fbodyaccjerk-mean-x"      
[53] "fbodyaccjerk-mean-y"       "fbodyaccjerk-mean-z"       "fbodyaccjerk-std-x"        "fbodyaccjerk-std-y"       
[57] "fbodyaccjerk-std-z"        "fbodyaccjerk-meanfreq-x"   "fbodyaccjerk-meanfreq-y"   "fbodyaccjerk-meanfreq-z"  
[61] "fbodygyro-mean-x"          "fbodygyro-mean-y"          "fbodygyro-mean-z"          "fbodygyro-std-x"          
[65] "fbodygyro-std-y"           "fbodygyro-std-z"           "fbodygyro-meanfreq-x"      "fbodygyro-meanfreq-y"     
[69] "fbodygyro-meanfreq-z"      "fbodyaccmag-mean"          "fbodyaccmag-std"           "fbodyaccmag-meanfreq"     
[73] "fbodyaccjerkmag-mean"      "fbodyaccjerkmag-std"       "fbodyaccjerkmag-meanfreq"  "fbodygyromag-mean"        
[77] "fbodygyromag-std"          "fbodygyromag-meanfreq"     "fbodygyrojerkmag-mean"     "fbodygyrojerkmag-std"     
[81] "fbodygyrojerkmag-meanfreq" "activityid" 
```

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
