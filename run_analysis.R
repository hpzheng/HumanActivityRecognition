## Function to load the datasets
load.data <- function(setname) {
    TMP <- fread(paste(setname,"/subject_",setname,".txt",sep=""),header=F)
    TMP <- cbind(TMP, fread(paste(setname,"/y_",setname,".txt",sep=""),header=F))
    cbind(TMP, fread(paste(setname,"/X_",setname,".txt",sep=""),header=F))
}

## Step 1. Merges the training and the test sets to create one data set.
my.dir <- getwd()
setwd("UCI HAR Dataset")

FEA <- fread("features.txt",header=F)
colnames(FEA) <- c("fea_id", "fea_name")
ACT <- fread("activity_labels.txt",header=F)
colnames(ACT) <- c("act_id", "act_name")

DT <- load.data("test")
DT <- rbind(DT, load.data("train"))
colnames(DT) <- c("subject_id", "act_id", as.vector(FEA$fea_name))
setwd(my.dir)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
DF0 <- data.frame(DT)
SAT <- DF0[,c(1,2)]
DAT <- DF0[,grepl("mean|std",names(DF0))]


## 3. Uses descriptive activity names to name the activities in the data set
DF <- SAT %>%
    merge(ACT) %>%
    select(-act_id) %>%
    cbind(DAT)


## 4. Appropriately labels the data set with descriptive variable names.

# This was done in Step 1.


## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
DF2 <- aggregate(.~subject_id + act_name, DF, mean)
    

