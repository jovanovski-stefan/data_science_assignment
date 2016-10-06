#list of needed library
packages <- c("dplyr", "tidyr", "reshape2")

#If required packages not available installs them
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

#Loads required packages
lapply(packages, library, character.only = TRUE) 

#Download data
filename <- ("./dataset.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              filename)
unz(filename) #unzip data
unlink(filename) #detach temporary filename variable

## Load data 
activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
  
## Load features
features <- read.table("features.txt")
feature_names <-  features[,2]

##Load test data and label the dataframe's columns
testdata <- read.table("./test/X_test.txt")
colnames(testdata) <- feature_names
  
## Read the training data and label the dataframe's columns
traindata <- read.table("./train/X_train.txt")
colnames(traindata) <- feature_names
  
## Read the ids of the test subjects and label the the dataframe's columns
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"
  
## Read the activity id's of the test data and label the the dataframe's columns
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"
  
## Read the ids of the test subjects and label the the dataframe's columns
train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"
  
## Read the activity id's of the training data and label 
##the dataframe's columns
train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"
  
##Combine the test subject id's, the test activity id's 
##and the test data into one dataframe
test_data <- cbind(test_subject_id , test_activity_id , testdata)
  
##Combine the test subject id's, the test activity id's 
##and the test data into one dataframe
train_data <- cbind(train_subject_id , train_activity_id , traindata)
  
##Combine the test data and the train data into one dataframe
all_data <- rbind(train_data,test_data)
  
##Keep only columns refering to mean() or std() values
mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_idx]
std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_idx]
meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
  
##Merge the activities datase with the mean/std values 
descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
##Melt the dataset with the descriptive activity names for better handling
data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
  
##Dataset as per average of each variable, activity and subject 
mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
  
## New tidy dataset
write.table(mean_data,"./tidy_dataset.txt")