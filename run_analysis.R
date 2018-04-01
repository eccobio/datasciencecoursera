# read activity labels from file into activity_labels table 
activity_labels <- read.table("./data/activity_labels.txt", col.names = c("id","label"))

# read all feature names and id from features file
all_features <- read.table("./data/features.txt", col.names = c("id","name"))

# load dplyr library
library(dplyr)

# logical vector for selecting only those variables featuring mean and standard deviation values
relevant_features_columns <- filter(all_features, grepl("(mean|std)[(][)]", name))

# TYDING UP VARIABLE NAMES 

patterns <- c("body", "gravity", "acc", "gyro", "jerk", "mean", "std", "mag", "-", "\\(\\)")
replaces <-  c("bo", "gr", "ac", "gy", "jk", "mn", "sd", "mg", "", "") # c("b", "gr", "a", "gy", "j", "m", "s", "", "", "")

# shorten() function below transforms relevant variable names to lower case, removing non-char symbols and shortens them to roughly half its original length 
# using vectors 'patterns' and 'replaces' above following dictionary: Body = bo, Acc = ac, Gravity = gr, Gyros = gy, Jerk = jk, Mag = mg, std = sd, mean = mn
# the resulting variables which names end in x,y or z contain dimentional values, those that do not end in those letters contain 'magnitudinal' values

shorten <- function( patt, repl, x ){
  n = length(patt)
  if( n != length(repl) )
    stop("Pattern and replacement vectors are not the same length.")
  result <- tolower(x)
  for( i in 1:n){
    result <- gsub(patt[i], repl[i], result)
  }
  
  result
}

tidy_var_names <- shorten(patterns, replaces, all_features$name)

# LOADING TEST DATA ...

# read all subject identifiers from subject_test.txt file into one-column table
test_subjects <- read.table("./data/test/subject_test.txt", col.names = c("subject"))

# read all activity identifiers from y_test.txt file into one-column table
test_activities <- read.table("./data/test/y_test.txt", col.names = c("activity"))

# load all test values from x_test.txt file onto data.frame
test_values <- read.table("./data/test/x_test.txt", col.names = tidy_var_names )

# select only variables containing mean and standard deviation values
test_values <- select(test_values, relevant_features_columns$id)

# merge all loaded data into one data frame ...
test_ds <- data.frame(test_subjects, test_activities, test_values)

# make memory room
rm(test_values)
rm(test_subjects)
rm(test_activities)

# LOADING TRAIN DATA ...

# read all subject identifiers from subject_train.txt file into one-column table
train_subjects <- read.table("./data/train/subject_train.txt", col.names = c("subject"))

# read all activity identifiers from y_train.txt file into one-column table
train_activities <- read.table("./data/train/y_train.txt", col.names = c("activity"))

# load all train values from x_train.txt file onto data.frame
train_values <- read.table("./data/train/x_train.txt", col.names = tidy_var_names )

# select only variables containing mean and standard deviation values
train_values <- select(train_values, relevant_features_columns$id)

# merge all loaded data into one data frame ...
train_ds <- data.frame(train_subjects, train_activities, train_values)

# MERGING TEST AND TRAIN DATA FRAMES INTO SINGLE COMPLETE DATA FRAME

all_ds <- rbind(test_ds, train_ds)

# CHANGE activity variable values from integer to labels

all_ds$activity <- as.character(activity_labels[all_ds$activity,2])

# make memory room
rm(test_ds)
rm(train_ds)
rm(train_values)
rm(train_subjects)
rm(train_activities)
rm(all_features)
rm(relevant_features_columns)

# creating data set 'grouped_means' with means of all variables by subject and activity

grouped_means <- group_by(all_ds, subject, activity) %>% summarise( tboacmnx = mean(tboacmnx), tboacmny = mean(tboacmny), tboacmnz = mean(tboacmnz), tboacsdx = mean(tboacsdx), tboacsdy = mean(tboacsdy), tboacsdz = mean(tboacsdz), tgracmnx = mean(tgracmnx), tgracmny = mean(tgracmny), tgracmnz = mean(tgracmnz), tgracsdx = mean(tgracsdx), tgracsdy = mean(tgracsdy), tgracsdz = mean(tgracsdz), tboacjkmnx = mean(tboacjkmnx), tboacjkmny = mean(tboacjkmny), tboacjkmnz = mean(tboacjkmnz), tboacjksdx = mean(tboacjksdx), tboacjksdy = mean(tboacjksdy), tboacjksdz = mean(tboacjksdz), tbogymnx = mean(tbogymnx), tbogymny = mean(tbogymny), tbogymnz = mean(tbogymnz), tbogysdx = mean(tbogysdx), tbogysdy = mean(tbogysdy), tbogysdz = mean(tbogysdz), tbogyjkmnx = mean(tbogyjkmnx), tbogyjkmny = mean(tbogyjkmny), tbogyjkmnz = mean(tbogyjkmnz), tbogyjksdx = mean(tbogyjksdx), tbogyjksdy = mean(tbogyjksdy), tbogyjksdz = mean(tbogyjksdz), tboacmgmn = mean(tboacmgmn), tboacmgsd = mean(tboacmgsd), tgracmgmn = mean(tgracmgmn), tgracmgsd = mean(tgracmgsd), tboacjkmgmn = mean(tboacjkmgmn), tboacjkmgsd = mean(tboacjkmgsd), tbogymgmn = mean(tbogymgmn), tbogymgsd = mean(tbogymgsd), tbogyjkmgmn = mean(tbogyjkmgmn), tbogyjkmgsd = mean(tbogyjkmgsd), fboacmnx = mean(fboacmnx), fboacmny = mean(fboacmny), fboacmnz = mean(fboacmnz), fboacsdx = mean(fboacsdx), fboacsdy = mean(fboacsdy), fboacsdz = mean(fboacsdz), fboacjkmnx = mean(fboacjkmnx), fboacjkmny = mean(fboacjkmny), fboacjkmnz = mean(fboacjkmnz), fboacjksdx = mean(fboacjksdx), fboacjksdy = mean(fboacjksdy), fboacjksdz = mean(fboacjksdz), fbogymnx = mean(fbogymnx), fbogymny = mean(fbogymny), fbogymnz = mean(fbogymnz), fbogysdx = mean(fbogysdx), fbogysdy = mean(fbogysdy), fbogysdz = mean(fbogysdz), fboacmgmn = mean(fboacmgmn), fboacmgsd = mean(fboacmgsd), fboboacjkmgmn = mean(fboboacjkmgmn), fboboacjkmgsd = mean(fboboacjkmgsd), fbobogymgmn = mean(fbobogymgmn), fbobogymgsd = mean(fbobogymgsd), fbobogyjkmgmn = mean(fbobogyjkmgmn), fbobogyjkmgsd = mean(fbobogyjkmgsd))

# save data set to csv file
write.csv(grouped_means, row.names = F, file = "data_output/grouped_means.csv")






