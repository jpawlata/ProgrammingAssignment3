## Data Science Specialization - Getting and Cleaning Data
## WEEK 4 PROGRAMMING ASSIGNMENT
## Author: Justyna Pawlata
## Date: Dec 8, 2017

## Additional script with functions used in the run_analysis.R

# Read the file
read_file <- function(directory, filepath, header){
    path <- file.path(directory, filepath)
    read.table(path, header = header)
}

# Merge data
merge_data <- function(data1, data2){
    
    # check length of the datasets
    if(length(data1) != length(data2)){
        stop("Data files of different length")
    }else{
        rbind(data1, data2)
    }
}