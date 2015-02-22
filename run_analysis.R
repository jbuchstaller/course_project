library(dplyr)

#read in data
test_data <- read.table("test/X_test.txt", colClasses = "character")
train_data <- read.table("train/X_train.txt", colClasses = "character")
subject_test <- read.table("test/subject_test.txt", colClasses = "character")
subject_train <- read.table("train/subject_train.txt", colClasses = "character")
labels_test <- read.table("test/y_test.txt", colClasses = "character")
labels_train <- read.table("train/y_train.txt", colClasses = "character")
features2 <- read.table("features.txt", colClasses = "character")

#combine data
test_list <- cbind(subject_test,labels_test,test_data)
train_list <- cbind(subject_train,labels_train,train_data)
test_and_train_list <- rbind(test_list,train_list)

#create list with column names and rename columns
V1=as.character(c("1","2"))
V2=as.character(c("Subject", "Activity"))
features1 <-data.frame(V1,V2)
features1 <- data.frame(lapply(features1, as.character), stringsAsFactors=FALSE)
features <- rbind(features1, features2)
colnames(test_and_train_list) <-c(features$V2)

#subset for columns containing mean and standard deviation
test_and_train_list_means_and_variances <- test_and_train_list[c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]

#replace activity numbers by labels
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 5] <- "STANDING"
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 4] <- "SITTING"
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 6] <- "LAYING"
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 3] <- "WALKING_DOWNSTAIRS"
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 2] <- "WALKING_UPSTAIRS"
test_and_train_list_means_and_variances$Activity[test_and_train_list_means_and_variances$Activity == 1] <- "WALKING"

#group by subject and activity and generate the mean of each column
test_and_train_list_means_and_variances[, c(3:68)] <- sapply(test_and_train_list_means_and_variances[, c(3:68)], as.numeric)
test_and_train_list_means_and_variances3 <- group_by(test_and_train_list_means_and_variances, Subject, Activity)
test_and_train_list_means_and_variances4 <- summarise_each(test_and_train_list_means_and_variances3, funs(mean))

#write the table into a text file, read the text file back into R and view
write.table(test_and_train_list_means_and_variances4, file = "Course_Project_Tidy_dataset.txt", row.name=FALSE)
#studentsfile <-read.table("http://s3.amazonaws.com/coursera-uploads/user-61e9acc2fa886a096e69233f/973498/asst-3/5f1699e0bad311e49e8abba2f2a3df6c.txt", header = TRUE)
#view(studentsfile)