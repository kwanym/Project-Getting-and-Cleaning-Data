Data Source:
Dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" 
Link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script (run_analysis.R) performs the following:

1)
Merges train/X_train.txt with test/X_test.txt to form a 10299x561 data frame. 
Merges train/subject_train.txt with test/subject_test.txt to form a 10299x1 data frame with subject_IDs 
Merges train/y_train.txt with test/y_test.txt to form a 10299x1 data frame with activity_IDs.

2)
Reads features.txt and extracts only the measurements on the mean and standard deviation to form a 10299x66 data frame. 66 out of 561 attributes are measurements on the mean and standard deviation. The values of the features are bounded within [-1,1].

3)
Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

walking
walkingupstairs
walkingdownstairs
sitting
standing
laying

4) 
The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed. Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as merged_XY.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. 

Some examples of the names of the attributes are as follows:
tbodyccc-mean-x, tbodyccc-mean-y, tbodyccc-mean-z,
tBodyacc-std-x, tBodyacc-std-y, tBodyacc-std-z,
tgravityacc-mean-x, tgravityacc-mean-y, tgravityacc-mean-z,
tgravityacc-std-x, tgravityacc-std-y, tgravityacc-std-z,
tBodyGyro-mean-x,tBodyGyro-mean-y, tBodyGyro-mean-z ...

5) 
Creates a second tidy data set with the average of each measurement for activity and subject. 
Result is saved as average_activity_subject.txt.
