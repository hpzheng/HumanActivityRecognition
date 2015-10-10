The following files data are required to process the data cleaning procedure:
=============================================================================

1. Directory "UCI HAR Dataset", which contains all raw data
2. File "features.txt", which contains descriptive variable names for measurables
3. File "activity_labels.txt", which contains descriptive activity names
4. Directory "test", which contains test data
   * File "X_test.txt", which contains measured data
   * File "subject_test.txt", which contains subject IDs
   * File "y_test.txt", which contains activity IDs
5. Directory "train", which contains training data
   * File "X_train.txt", which contains measured data
   * File "subject_train.txt", which contains subject IDs
   * File "y_train.txt", which contains activity IDs



Function defined:
=================

A function "load.data()" is defined to load raw data for either test or train
subdirectories. the corresponding subject IDs and activity IDs will also be
loaded.



Variables defined:
==================

* 'FEA': data table storing descriptive variable names for measurables
* 'ACT': data table storing descriptive activity names
* 'DT':  data table holding the raw data
* 'DF0': data frame holding the raw data
* 'SAT': data frame holding subject IDs and activity IDs
* 'DAT': data frame holding only the measurements on the mean and standard deviation
* 'DF':  data frame holding transformed data
* 'DF2': data frame holding independent tidy data set with the average of each
       variable for each activity and each subject



Transformations performed:
==========================

* In step 1, all test and training data were combined using cbind() and rbind()

* In step 2, a transformation was performed to 'select' columns with either
  'mean' or 'std' in the name

* In step 3, a transformation was performed to 'merge' the descriptive activity
  names into the data

* In step 5, a 'group_by' transformation was performed to 'summarize' the
  average of each variable for each activity and each subject





