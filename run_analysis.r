#Step 1 - preparing the data files

#Step 1.1 - init variables
download_URL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zipped_file <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"


#Step 1.2 - cleanup
unlink(zipped_file)
unlink("UCI HAR Dataset",recursive = TRUE)


#Step 1.3 - download zipped data file and unzip it
download.file(download_URL, destfile = zipped_file)
unzip(zipped_file)


#Step 2 read data into the tables
 

#Step 2.1 loading test subject data 
test_x <-read.table("./UCI HAR Dataset/test/x_test.txt")
test_y <-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
 
 
#Step 2.2 loading train subject data 
train_x<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
 
 
#Step 2.3 Get activity labels 
activity_label<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_label)<-c("activity_id", "activity_nm")


#Step 2.4 Get features labels
feature_nm<-read.table("./UCI HAR Dataset/features.txt", colClasses = c("character")) 


#Step 3 Merges the training and the test sets to create one data set.
training_data<-cbind(train_x, train_subject)
training_data<-cbind(training_data, train_y)

testing_data<-cbind(test_x, test_subject)
testing_data<-cbind(testing_data, test_y)

complete_dataset<-rbind(training_data, testing_data)  # Solution 1 :- Merges the training and the test sets to create one data set.

complete_dataset_col_nm<-rbind(rbind(feature_nm, c(562, "subject")), c(563, "activity_id"))[,2]
names(complete_dataset)<-complete_dataset_col_nm


#Step 4. get  mean and standard deviation for each measurement.
mean_standard_dev <- complete_dataset[,grepl("mean\\(\\)|std\\(\\)|subject|activity_id", names(complete_dataset))]   # Solution 2 :- Extracts only the measurements on the mean and standard deviation for each measurement. 

require(plyr)
mean_standard_dev <- join(mean_standard_dev, activity_label, by = "activity_id", match = "first") # Solution 3 :- Uses descriptive activity names to name the activities in the data set
mean_standard_dev <- mean_standard_dev[,-1]

names(mean_standard_dev) <- gsub("([()])","",names(mean_standard_dev)) # Solution 4 :- Appropriately labels the data set with descriptive variable names. 
names(mean_standard_dev) <- make.names(names(mean_standard_dev)) 



#Step 5. average of each variable for each activity and each subject 
output_data<-ddply(mean_standard_dev, c("subject","activity_nm"), numcolwise(mean)) # Solution 5 :- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

write.table(output_data, file = "output_avg_data.txt", row.name=FALSE) 