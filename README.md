# Dataset of Means of means and standard deviation of Human Activity Recognition Using Smartphones Dataset - Version 1.0 - Astianax Cabrera


The values in this data set are agregates of a limited section of the above mentioned dataset, namely the means of only those variables featuring means and standard deviation of time and frequency measurements. Each value is the mean of a subset of subject and activity grouping. Some of the original vectors on which the mean function is applied are dimentional (representing an x, y, or z component) or non-dimentional. 

## For each record it is provided:

 
* A 66-feature vector with means of time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## The dataset includes the following files:

* 'README.md'

* 'CodeBook.md'

* 'grouped_means.csv' 

* 'run_analysis.R'


## Notes: 


The names of each variable in the present dataset are simplified/compressed version of the original variables they aggregate by the following compression scheme:

Body: bo
Acc: ac
Gyro: gy
Gravity: gr
Mag: mg
Jerk: jk
std: sd
mean: mn


furthermore, the variable names have been converted to lower case and all non-alpha characters have been removed. For example, the mean of all values of the feature variable 'tBodyAcc-mean()-Z' that correspond to standing as measured on subject number 4 will be in the column named 'tboacmnz' in the same row where column 'activity' is 'STANDING'  and column 'subject' is 4. 
