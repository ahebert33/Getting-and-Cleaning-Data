Getting and Cleaning Data Week 4 project
----------------------------------------

This document will provide a descripition of all declared variables for
protocol run\_analysis.R

### Files imported for this script

run\_analysis.R is an R script file that contains no functions

Data for this project was retrieved from the link below

UCI\_HAR\_dataset - Human Activity Recognition Using Smartphones
datasets
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

For a complete description of the raw data see the README file included
with the above data set. Below are the actual files extracted and used
in this script

features.txt contains 2 variables and 561 observations features\_key -
int measurement\_type - char

activity\_labels.txt contains 2 variables and 6 observations
activity\_key activity

subject\_test.txt contains 1 variable and 2947 observations subject\_key
subject\_train.txt contains 1 variable and 7352 observations

x\_test.txt contains 561 variables and 2947 observations see
features.txt - contains column names for this file

y\_test.txt contains 1 variable and 2947 observations activity\_key

x\_train.txt contains 561 variables and 7352 observations column names
come from features.txt y\_train.txt contains 1 variable and 7352
observations actvity\_key

### run\_analysis.R script variables

var features - a table containing data read in from features.txt add
column names to this table “features\_key” and “measurment\_type” var
activities - a table that contains a description of the activity
performed and a “key column” activity\_key, activity var subject\_test a
table with one column containing an integer as a subject identifier for
the test data set

var subject\_train - a table with one column containing an int as a
subject identifier for the training data set

var x\_test - a data.frame with measurments for each feature for test
data set

var x\_train - a data.frame with measurments for each feature for
training data set

var y\_test - a data.frame with activity\_key for test data set var
y\_train - a data.fram with activity\_key for training data set

var all\_train - a data.frame in which all columns from y\_train,
subject\_train and x\_train are combined activity\_key, subject\_key,
features

var all\_test - a data.frame in which all columns from y\_test,
subject\_test and x\_test are combined activity\_key, subject\_key,
features

var all\_data - a data.frame in which the rows from all\_train and
all\_test are concatenated together

var headers\_list - a list of chr containing all the column names from
all\_data

var keep\_Cols - a list of logicals of which column names meet criteria
for keeping (TRUE) any col that contains mean() or std() cols
activity\_key and subject\_key

var selected\_data - a new data.frame containing only those columns
listed as TRUE in keep\_Cols

var labeled\_selected\_data - the selected\_data data.frame with a
descriptive label for each activites this needs to be done close to the
end of the processing as it will reorder the data

var Data\_Results - final tidy data set containing means for each column
by activity then by subject
