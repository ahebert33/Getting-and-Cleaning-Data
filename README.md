Getting and Cleaning Data Week 4 project - README
-------------------------------------------------

this will describe what actions the R script run\_analysis will perform
on files from the UCI HAR Dataset see code book for description and
source of this dataset and variables used in analysis

### run\_analysis.R

this script will read in data from multiple file, appropriately label
all variables, merge/concatenate file as needed and ultimately summarize
certain columns by generating means for these columns by activity and
subject

Intended to be used in conjuction wth the R script. 1. read in features
data from features.txt contains 561 observations 2 variables -
features.key and features features are the different measurments taken
and will act as column names for other data 2. read in activities data
from activities\_label.txt contains 6 observations 2 variables
activities\_key activity - description of various activities during
which measurments were performed 3. read in subject id’s for training
and test data sets (subject\_train.txtx and subject\_test.txt) label
column as subject\_key 4. read in x\_test and x\_train files apply
column names from features 5. read in y\_test and y\_train files rename
col header to activity\_key 6. all\_test - combine cols from y\_test
(activity), subject\_test, and x\_test (measurment) cind()

1.  all\_train - combine cols from y\_train (activity), subject\_train
    and x\_train

2.  all\_data - concatenate from all\_test and all\_train rbind()

3.  create a list of logicals of which columns are relevent to the final
    results

4.  selected\_data - use this list to create a data.frame of just the
    cols we are interested in.

5.  labeled\_selected\_data will use activity\_key to merge activity
    description with selected data this should be saved until all other
    merges etc are completed as it will reorder the data
6.  Data\_Results - uses the aggregate function to generate means on all
    mean() and std() columns by activity and then by subject
7.  write out final results to a file
