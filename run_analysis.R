#run_analysis.R
#Merge the training and tests sets to create one data set.
#Extractls only the measurements on the meand and SD for each measurement
#Users descriptive activity names.
#appropriately lables the data
#Creates a second independent tidy set with the averatge of each variable for each activity and each subject.

# it seems that all that I need to do is read in the X-Test in each of the two files.... Test and Train.
# throw them together. and rename the labels.
#Combine the data sets.

#truncated set to means and SDs

#Then create a second tidy one with average of each variable for both the activity and subject.

run_analysis <- function ()  {
        
        
        #Code for running function from my directory not from the WD as the class requres
        
#        #entireData <- (read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/train/X_train.txt", sep=""))
        
#open the data sets 
        
#       #test_data <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/test/X_test.txt", sep="",header=FALSE)
#       #test_data_act <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/test/y_test.txt", sep="",header=FALSE)
#       #test_data_sub <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/test/subject_test.txt", sep="",header=FALSE)
#       #train_data <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/train/X_train.txt", sep="",header=FALSE)
#       #train_data_act <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/train/y_train.txt", sep="",header=FALSE)
#       #train_data_sub <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/train/subject_train.txt", sep="",header=FALSE)

#Read in the labels:
#        #act <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
#        #feat <- read.table("~/R Projects/Data/run_analysis/UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
    
        #str  (test_data)  check the value o - debug
        
        #Code for running it from the WD - NOT MY DIRECTORY
        entireData     <- read.table("./UCI HAR Dataset/train/X_train.txt",                        sep="")              
        test_data      <- read.table("./UCI HAR Dataset/test/X_test.txt",                          sep="",header=FALSE)
        test_data_act  <- read.table("./UCI HAR Dataset/test/y_test.txt",                          sep="",header=FALSE)
        test_data_sub  <- read.table("./UCI HAR Dataset/test/subject_test.txt",                    sep="",header=FALSE)
        train_data     <- read.table("./UCI HAR Dataset/train/X_train.txt",                        sep="",header=FALSE)
        train_data_act <- read.table("./UCI HAR Dataset/train/y_train.txt",                        sep="",header=FALSE)
        train_data_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",                  sep="",header=FALSE)        
        act            <- read.table("./UCI HAR Dataset/activity_labels.txt",                      header=FALSE,colClasses="character")
        feat           <- read.table("./UCI HAR Dataset/features.txt",                             header=FALSE,colClasses="character")
              
#RENAME  the value of of the collumns
        subA <- c("Activities")
        subS <- c("Subjects")
        colnames(test_data)        <-feat$V2
        colnames(train_data)       <-feat$V2
        colnames(test_data_act)    <-c(subA)
        colnames(train_data_act)   <-c(subA)
        colnames(test_data_sub)    <-c(subS)
        colnames(train_data_sub)   <-c(subS)

#merge the data sets
        test_data       <-cbind(test_data,test_data_act)
        test_data       <-cbind(test_data,test_data_sub)
        train_data      <-cbind(train_data,train_data_act)
        train_data      <-cbind(train_data,train_data_sub)
        entire_data_set <-rbind(test_data,train_data)
        #str (entire_data_set) Checks entire_data_packet

# Mean and Standard Deviation
        entire_data_set_mean  <-sapply(entire_data_set,mean,na.rm=TRUE)
        entire_data_set_sd    <-sapply(entire_data_set,sd,na.rm=TRUE)

#create a data table - load in data.table library
        library(data.table) #used in next line:
        final_data_table      <- data.table(entire_data_set)
        final_tidy_data       <-final_data_table[,lapply(.SD,mean)]

#Complete the project by writing a final tiny data file. - 
        write.table(final_tidy_data,file="final_tidy_data.txt", sep = "\t" ,row.names = FALSE)



        
}