Getting and Cleaning Data Project
===============

Intro
===============
This is a repository for the submission of the Getting and Cleaning Data course project.
This repository hosts the R scrypt file and documentation files.

A full description is available at the site where the data was obtained: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Running the script
===============
1. Unzip the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project
1. Set the default path of the working directory as `"getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset"`
2. Put `run_analysis.R` in the working directory
3. Run `run_analysis.R`
4. The resulting cleaned `dataset.txt` will be available in the working directory

** this R script uses the `data.table` library. You can install it using `install.packages("data.table")` command.

Project Files
===============
`CodeBook.MD`   - describes the variables

`run_analysis.R`- contains the code to perform the analyses

`dataset.txt`   - the output
