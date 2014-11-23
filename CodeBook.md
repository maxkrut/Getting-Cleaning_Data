#VARIABLES

The data from the downloaded files
===============
`features_names`, `trainSet`, `train_Labels`, `train_Subjects`, `testSet`, `test_Labels`, `test_Subjects`, `activity`

Merged datasets
===============
`mergedSet`, `Set`, `dt`, `dataset`

Extracting columns
===============
The script uses `grepl` function to extract columns with `mean()` and `std()`

Naming the activities in the data set
===============
`activity_labels.txt` as factors
```R
labels <- factor(c(activity[,1]), labels = activity[,2])

train.activity.names <- factor(train_Labels[,1], labels = labels)
train.activity.names <- as.character(train.activity.names)

test.activity.names <- factor(test_Labels[,1], labels = labels)
test.activity.names <- as.character(test.activity.names)
```

`data.table` library for creating an independent tidy data set
===============
with the average of each variable for each activity and each subject.
===============
```R
dt <- data.table(Set)
```
setting key to "Subject" and "Activity" columns
```R
keycols <- c("Subject", "Activity")
setkeyv(dt, keycols)
```
grouping by key and using `lapply`
```R
dataset <- dt[,lapply(.SD,mean),by = key(dt)]
```
writting final dataset
```R
write.table(dataset, file = "dataset.txt", row.name = FALSE)
```
