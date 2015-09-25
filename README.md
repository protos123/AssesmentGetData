# Readme
Jesus Rincon  
25 de septiembre de 2015  
# Objectives

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Run analysis

This R script locates and downloads the dataset UCI HAR Dataset. Then it unzips it in the location defined.

After this it reads and merges X, y and subject datasets, from train and test folders.

Then it assigns to x the variable names, in order to filter those which are mean and standard deviation, to erase unnecesary variables. Also, in the y data, numbers are replaced by the activity they represent.

After this, the first dataset is created, by mergin subject ids, activity and the rest of the variables, hence we get a 102299 rows per 68 columns dataset, which is written in a table called dataset1.

The data is then averaged in order to get the tidy dataset. This dataset has only 180 rows, 30 subjects and 6 activities, per 68 variables. Also is written in a table called dataset2.
