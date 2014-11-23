Getting and Cleaning Data Project
===============

Intro
===============
This is a repository for the submission of the Getting and Cleaning Data course project.
This repository hosts the R script file and documentation files.

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.

A full description is available at the site where the data was obtained: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
The data linked to website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Running the script
===============
1. Unzip the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project
1. Set the default path of the working directory as `"getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset"`
2. Put `run_analysis.R` in the working directory
3. Run `run_analysis.R`
4. The resulting clean `dataset.txt` will be available in the working directory

** this R script uses the `data.table` library. You can install it using `install.packages("data.table")` command.

Project Files
===============
`CodeBook.MD`   - describes the variables

`run_analysis.R`- contains the code to perform the analyses

`dataset.txt`   - the output
