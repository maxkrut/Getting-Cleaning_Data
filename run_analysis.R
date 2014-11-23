# loading library for working with final dataset
library(data.table)

# loadind features names
features_names  <- read.table("features.txt",
                   header = FALSE, stringsAsFactors = FALSE)[,2]

# train set loading
trainSet        <- read.table("train/X_train.txt",
                   header = FALSE, col.names = features_names)

train_Labels    <- read.table("train/y_train.txt",
                   header = FALSE, col.names = "Activity")

train_Subjects  <- read.table("train/subject_train.txt",
                   header = FALSE, col.names = "Subject")
                
# adding columns "Activity" and "Subject"
trainSet[,562]  <- train_Labels
trainSet[,563]  <- train_Subjects

# test set loading
testSet        <- read.table("test/X_test.txt",
                  header = FALSE, col.names = features_names)

test_Labels    <- read.table("test/y_test.txt",
                  header = FALSE, col.names = "Activity")

test_Subjects  <- read.table("test/subject_test.txt",
                  header = FALSE, col.names = "Subject")
                              
# adding columns "Activity" and "Subject"
testSet[,562]  <- test_Labels
testSet[,563]  <- test_Subjects

# merging to one large set
mergedSet <- merge(trainSet, testSet, all=TRUE)

#seeking for mean() and std() columns
ext <- c()
j <- 0

# loop
for (i in 1:ncol(mergedSet)) {
        
# searching "mean()" and "std()" in columns names by "grepl" function
        if (grepl(".*\\bmean()\\b", names(mergedSet)[i], perl=TRUE)==TRUE) {
                ext[j+1] <- i
                j=j+1 
        }
        
        if (grepl(".*\\bstd()\\b", names(mergedSet)[i], perl=TRUE)==TRUE) {
                ext[j+1] <- i
                j=j+1 
        }        
}

#new set with extracted columns + "activities" and "subjects" columns
Set <- mergedSet[,c(ext,562:563)]

# setting labels
activity  <- read.table("activity_labels.txt", 
             col.names = c("Activity","Activity name"))
         
# activity_labels.txt as factors
labels <- factor(c(activity[,1]), labels = activity[,2])

train.activity.names <- factor(train_Labels[,1], labels = labels)
train.activity.names <- as.character(train.activity.names)

test.activity.names <- factor(test_Labels[,1], labels = labels)
test.activity.names <- as.character(test.activity.names)

# new labels in "Activity" column
Set[,"Activity"] <- c(train.activity.names,test.activity.names)

# using data.table library
dt <- data.table(Set)

# setting key to "Subject" and "Activity" columns
keycols <- c("Subject", "Activity")
setkeyv(dt, keycols)

# group by key
dataset <- dt[,lapply(.SD,mean),by = key(dt)]

# writting final dataset
write.table(dataset, file = "dataset.txt", row.name=FALSE)
