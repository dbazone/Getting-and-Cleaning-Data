## ReadMe file for "Getting and Cleaning Data" assignment

# This script is written and tested under R version 3.2.0

# Script will automatically download the input data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  in your current working folder

# Script will unzip the file as well.

# It will create a flat file output_avg_data.txt in the current working directory which is the output of the script.

# Please see following Assignment task along with their solution. 
		Task 1 - Merges the training and the test sets to create one data set.
		Solution 1 - data is merged from training and testing data frame and loaded in complete_dataset variable. Please search for "Solution 1" keyword in R script to locate where this action being performed. 
		
		Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
		Solution 2 - Data is extracted for mean and std. deviation for each mesaurment in mean_standard_dev variable. Please search for "Solution 2" keyword in R script to locate where this action being performed. 
		
		Task 3 - Uses descriptive activity names to name the activities in the data set
		Solution 3 - This action is performed on the mean_standard_dev variable which is the output of Task 2.  Please search for "Solution 3" keyword in R script to locate where this action being performed. 
		
		
		Task 4 - Appropriately labels the data set with descriptive variable names. 
		Solution 3 - This action is again performed on the mean_standard_dev variable which is the output of Task 3.  Please search for "Solution 4" keyword in R script to locate where this action being performed.
		
		Task 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
		Solution 5 - Data is stored in output_data variable for this task. Please search for "Solution 5" keyword in R script to locate where this action being performed.
		


# PLEASE DONT RUN THE SCRIPT IF MODIFIED INPUT DATA FILE ALREADY EXIST IN YOUR CURRENT WORKING FOLDER. If data file or input folder exist script will delete them and repopulate with the fresh data. If you have modified the input files in your current working folder then please run this script in a new working folder. 

# Script requires plyr package. 

