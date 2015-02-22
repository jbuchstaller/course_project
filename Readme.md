#Description of the experiment (as found in file README.txt of the assignment)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#Description of the assignment and methods used to achieve goals

##1) Merge the training and the test sets to create one data set (step 1)

Read in pertinent data sets. Used data sets containing the test and the training data (X_test.txt and X_train.txt), information about which subjects were tested in the different experiments (subject_test.txt and subject_train.txt), and the files containing which activity was tested during training or test (y_test.txt and y_train.txt). Also read in the file containing the variable descriptions (features.txt).

Merged the sets using the functions rbind and cbind

##2) Appropriately label the data set with descriptive variable names (step 4)

Read in the file with the variable names (features.txt) to use as column names. Added column names "Subject" and "Activity" to the vector
Renamed columns using the function columnnames.

##3) Extract only the measurements on the mean and standard deviation for each measurement. (step 2)

Subset only the columns that contain mean() and std() from all the columns included 

##4) Use descriptive activity names to name the activities in the data set (step 3)

Replaced the numbers that designated the activities in the second column with the appropriate designations found in the file activity_labels.txt

##5) Create a second, independent tidy data set with the average of each variable for each activity and each subject (step 5)

Using the plyr package, grouped the data by subject and activity and generated the mean of the variables in each column.




