#Loadind features names

features_names  <- read.table("features.txt",
                header = FALSE, stringsAsFactors = FALSE)[,2]

#TRAIN SET

trainSet        <- read.table("train/X_train.txt",
                header = FALSE, col.names = features_names)

train_Labels    <- read.table("train/y_train.txt",
                header = FALSE, col.names = "Activity")

train_Subjects  <- read.table("train/subject_train.txt",
                header = FALSE, col.names = "Subject")

trainSet[,562]  <- train_Labels

trainSet[,563]  <- train_Subjects

#TEST SET

testSet        <- read.table("test/X_test.txt",
                              header = FALSE, col.names = features_names)

test_Labels    <- read.table("test/y_test.txt",
                              header = FALSE, col.names = "Activity")

test_Subjects  <- read.table("test/subject_test.txt",
                              header = FALSE, col.names = "Subject")

testSet[,562]  <- test_Labels

testSet[,563]  <- test_Subjects

#MERGED SET
mergedSet <- merge(trainSet, testSet, all=TRUE)

#EXTRACTING mean() and std() columns

ext<-c()

j <- 0

for (i in 1:ncol(mergedSet)) {
        
        if (grepl(".*\\bmean()\\b", names(mergedSet)[i], perl=TRUE)==TRUE) {
                ext[j+1] <- i
                j=j+1 
        }
        
        if (grepl(".*\\bstd()\\b", names(mergedSet)[i], perl=TRUE)==TRUE) {
                ext[j+1] <- i
                j=j+1 
        }        
}

Set <- mergedSet[,c(ext,562:563)]

#SETTING ACTIVITY LABELS

activity  <- read.table("activity_labels.txt", 
         col.names = c("Activity","Activity name"))


labels <- factor(c(activity[,1]), labels = activity[,2])

train.activity.names <- factor(train_Labels[,1], labels = labels)
train.activity.names <- as.character(train.activity.names)

test.activity.names <- factor(test_Labels[,1], labels = labels)
test.activity.names <- as.character(test.activity.names)

Set[,"Activity"] <- c(train.activity.names,test.activity.names)


library(data.table)
dt <- data.table(Set)
keycols <- c("Subject", "Activity")
setkeyv(dt, keycols)
dataset <- dt[,lapply(.SD,mean),by = key(dt)]
write.table(dataset, file = "dataset.txt", row.name=FALSE)
