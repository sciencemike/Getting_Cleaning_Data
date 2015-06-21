# Getting_Cleaning_Data
Coursera class

This is the final project for Coursera/Getting and Cleaning Data

The data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


        
The goal of this project was to merge the data together from the Test and Train folders shown below.

The Data fit togther as shown here:

https://class.coursera.org/getdata-015/forum/thread?thread_id=112#comment-276


Download the data source = UCI HAR Dataset folder.

Directory Setup:

  UCI HAR Dataset
  
        Folder:Test
        
        Folder:Train
        
        File:activity_labels
        
        File:features
        
        File:features_info
        
        File:README

Insert run_analysis.R in the parent folder of UCI HAR Dataset.

Run source("run_analysis.R") with no parameters.

The result will be the file final_tidy_data.txt inside your WD.

##Explanation of code:

Line 18-  Beginning of real code. - Defines the function run_analysis ()

Line 40-49  - Loads the X and Y test and train data sets using read.table along with activity labels and features.

Line 52 -53 - Creates names "activies and subject" to be used in column names later.

Line 54-59 -  Renames the collumns with descriptive names in features.txt and the two names we defined above

Line 62-66 - using column bind to build my data set, and then using row bind to combine them together.

Line 67 - a debuging tool to check the output of the data set

line 70-71 - Mean and SD as required in the instructions using sapply to apply the function to the data set

line 74 - Load the data.table library with = library(data.table)

line 75-76 - created the data table and SD, average the data as requred

Line 79- Write the tidy data file using write.table.


