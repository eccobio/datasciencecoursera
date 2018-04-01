## Data Set Structure

The present data set, stored in file grouped_means.csv, constitute a table of 68 variables and 180 observations conveying a distilled representation of a subset of variables from the data set downloadable at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and described at length at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.The subset in question is made up of only the variables from the original set with values expressing means and standard deviations. Each row of the grouped_means data set contains the means of all observed values per subject while performing one of 6 activities.

## Data

All data is of class numeric, conforming to traditional type double float, and conveys the means of vectors of time and frequency values as measured by accelerometer and gyroscope in the original study.
There were no NA values in the source/parent data set and no NAs were introduced by the sub setting and transformations employed in the creation of the present data set.  

## Variables - Taxonomy

Each of the 66 mean variables in the data set was named using the following convention:

t or f: at the first position of the variable names refer to time or frequency correspondently. This is consistent with the parent/source data set.
bo: body – referring to a variable conveying body linear acceleration or body angular velocity.
gr: gravity – gravity acceleration 
ac: accelerometer – value read from accelerometer in measuring device.
gy: gyroscope – value read from gyroscope in measuring device. 
jk: jerk – jerk from linear acceleration and angular velocity
mg: magnitude - 	calculated from combining three-dimensional signals obtained from accelerometer and gyroscope
mn: mean - mean value
sd: std – standard deviation value
x, y, z: X,Y,Z – dimensional component from 3-axial signal from values obtained from accelerometer and gyroscope. this is consistent with the parent/source data set.

The above scheme results in a set of 66 variable names of a maximum length of 13 characters. E.g.: ‘tboacsdz’ will be the variable name which value is the mean a subset of the feature vector ‘tBodyAcc-std()-Z’ in the source/parent data set. 
Since only a small fraction of the source/parent data set is used in the present data set, shorter variable names with minimal loss of readability suffice. Additionally these variable names look tidier and make it easier to select data subsets by variable names.

## Variables 

subject: integer 1:30 identifying the subject performing experiment
activity: one of six character strings (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) identifying the specific activity performed by subject while being observed

tboacmnx,tboacmny,tboacmnz,tboacsdx,tboacsdy,tboacsdz,
tgracmnx,tgracmny,tgracmnz,tgracsdx,tgracsdy,tgracsdz,
tboacjkmnx,tboacjkmny,tboacjkmnz,tboacjksdx,tboacjksdy,tboacjksdz,tbogymnx,tbogymny,tbogymnz,tbogysdx,tbogysdy,tbogysdz,tbogyjkmnx,tbogyjkmny,tbogyjkmnz,tbogyjksdx,
tbogyjksdy,tbogyjksdz,tboacmgmn,tboacmgsd,tgracmgmn,
tgracmgsd,tboacjkmgmn,tboacjkmgsd,tbogymgmn,tbogymgsd,
tbogyjkmgmn,tbogyjkmgsd,fboacmnx,fboacmny,fboacmnz,
fboacsdx,fboacsdy,fboacsdz,fboacjkmnx,fboacjkmny,
fboacjkmnz,fboacjksdx,fboacjksdy,fboacjksdz,fbogymnx,
fbogymny,fbogymnz,fbogysdx,fbogysdy,fbogysdz,fboacmgmn,fboacmgsd,fboboacjkmgmn,fboboacjkmgsd,fbobogymgmn,
fbobogymgsd,fbobogyjkmgmn,fbobogyjkmgsd: variables which values represent the means of mean-and-standard-deviation-featuring variables in source/parent data set. See ‘Variables – taxonomy’ section above.

## Transformations
The following was done to arrive at the present data set:
* The contents of text files activity_labels and features were read into tables by means of read.table().
* The contents of text files subject_test, X_test, y_test were read into vectors and tables by means of read.table() and subsequently merged into a data frame structure.
* The contents of text files subject_train, X_train, y_train were read into vectors and tables by means of read.table() and subsequently merged into a data frame structure.
* The two data frames referred to in two previous paragraphs was appended together into a single data frame structure named all_ds by means of rbind().
* Data frame all_ds was subsequently transformed by logical vector obtained from using grepl() and dplyr functions select() and filter() to select only variables featuring means and standard deviations.
* Using RegEx in gsub() via defined function shorten(), the feature variable names were transformed to a tidier format. See ‘Variables – Taxonomy’ section.
* The activity column in data frame all_ds was transformed by replacing its integer values with the corresponding activity labels extracted into a table from file activity_labels.txt.
* Functions group_by() and summarise() were utilized to subgroup by subject and activity and subsequently make summary table grouped_means with means of required sub set of vectors.
* Finally, the resulting data set was saved to file by means of function write.csv().

## Notes
The above transformations are reproducible thru the execution of script run_analysys.R, given the following assumptions:
*	The source raw data in its original directory structure has been saved to a directory named ‘data’ in R’s working directory. 
*	There exists a ‘data_output’ directory in the R’s working directory.
  

