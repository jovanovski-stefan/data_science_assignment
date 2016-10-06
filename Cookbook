R - script for JHU - Data Science - Course 2 assignment 
Analysis of Human Activity Recognition Using Smartphones Dataset
Created by Stefan Jovanovski - Data Science Intern in the Financial Industry

This code book summarizes the resulting data fields in tidy.txt.

The script analysis data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0
and produces a new dataset: tidy_dataset.

The original data has been taken from a group of 30 volunteers within an age bracket of 19-48 years. 
Volunteers have performed the following activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Volunteers have worn a Samsung Galaxy S II on the waist. The experiments were video-recorded to label the data manually. 
The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data 
and 30% the test data.

The original dataset included the following data files:

- 'features.txt': List of all features.
- 'activity_labels.txt': List of class labels and their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': ID's of subjects in the training data
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': ID's of subjects in the training data

The script works in the following way:

1. Lists required libraries, if present - does nothing, else installs them. Than loads them; 
2. Reads url to data, downloads data, unzips it; 
3. Reads required text files and labels them;
4. Variables are coerced/merged with test and training datasets;
5. Columns with mean() and std() values are extracted and then a new data frame is created;
6. Descrictive activity names mearged with mean/std dataset, creates new dataset. 
7. Data converted into table containing mean values of all the included features, ordered by the activity name and the subject id, 
and the data is written to the "tidy_dataset.txt" file.
