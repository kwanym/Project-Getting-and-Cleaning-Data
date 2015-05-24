# 1. Merge training and test sets to create one data set

temp1 <- read.table("train/X_train.txt")
temp2 <- read.table("test/X_test.txt")
X <- rbind(temp1, temp2)

temp3 <- read.table("train/y_train.txt")
temp4 <- read.table("test/y_test.txt")
Y <- rbind(temp3, temp4)

temp5 <- read.table("train/subject_train.txt")
temp6 <- read.table("test/subject_test.txt")
S <- rbind(temp5, temp6)

# 2. Extract the mean and standard deviation for each measurement and remove the brackets

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Use descriptions to name the activities - remove the "_" and change to lower case 

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"


# 4. Label the data set with descriptive variable names

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_XY.txt")


# 5. Create a second data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "average_activity_subject.txt")


