

# Getting and Cleaning Data project
# Andrew Hebert
# June 23, 2020
      

#setup wd() and paths for retreiving data.
# assumes that the data has been downloaded

#library dependencies (assumes they have been manually loaded)
# dpylr and 

#setwd("/Users/Heberts/Documents/R programming/DataCleaning/data/UCI HAR Dataset")

# read in features.txt - contains the column names for x_train.txt and y_train.txt
# add column names to features.txt table after it is retrieved

features <- read.table("./features.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(features) <- c("features_key", "measurment_type" )

# read in the activity labels file which contains 2 columns - activity_key and activity()
# add column name for both tables - subject_key
activities <- read.table("./activity_labels.txt", header = FALSE)
colnames(activities) <- c("activity_key","activity")

# read in subject_test.txt and subject_train.txt which contain 1 column with subject_key on each row
# for who the data belongs to
subject_test <- read.table("./test/subject_test.txt", header = FALSE)
subject_train <- read.table("./train/subject_train.txt", header = FALSE)
colnames(subject_test) <- "subject_key"
colnames(subject_train) <- "subject_key"


# read in the training and test data sets 
# x_test.txt contains 561 columns of different measuremnt types ( names will come from features table)
# y_test.txt contains 1 column with the activity_key
x_test <- read.table("./test/x_test.txt", header = FALSE)
colnames(x_test) <- features[,2]
y_test <- read.table("./test/y_test.txt", header = FALSE)
colnames(y_test) <- "activity_key"

# x_train.txt contains 561 columns of different measuremnt types ( names will come from features table)
# y_train.txt contains 1 column with the activity_key
x_train <- read.table("./train/x_train.txt", header = FALSE)
colnames(x_train) <- features[,2]

y_train <- read.table("./train/y_train.txt", header = FALSE)
colnames(y_train) <- "activity_key"

# all files read in and all columns tagged 
# next  merge and combine training tables and testing tables
all_train <- cbind(y_train, subject_train, x_train)
all_test <- cbind(y_test, subject_test, x_test)
all_data <- rbind(all_train, all_test)


# create a list of column names that will be kept (TRUE) and others not to keep (FALSE)
# Keep all columns that has mean or std in it, activity_key, subject_key
headers_list <- colnames(all_data)

keepCols <- grepl("activity_key", headers_list) | grepl("subject_key", headers_list) | grepl("mean\\(\\)", headers_list) | grepl("std\\(\\)", headers_list)

# use this logical vector to select appropriate columns from all_databased on the the filters set above
selected_data <- all_data[,keepCols]
# now merge activity labels with selected data using activity_key as common key
labeled_selected_data <- merge(selected_data, activities, by = "activity_key", all.x = TRUE)
labeled_selected_data %>% relocate(activity, .before = activity_key)

# remove activity_key column
labeled_selected_data$activity_key = NULL
Data_Results <- aggregate(. ~ activity + subject_key , labeled_selected_data,FUN = mean)

# save final results
write.table(Data_Results,"Cleaning_Data_project_results.txt", row.names = FALSE)
