# GettingAndCleaningData-CourseProject
Set up repo and rough first attempt

===================================================================================
run_analysis.R 
===================================================================================
        
This script does the following:

1. Merges training and test sets into single dataframe (df)
2. Extracts measurements on the mean and standard deviation for each measurement
3. Relables activities with descriptive activity names
4. Labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with average of each variable for 
   each activity and each subject (df1)

Code Book: ??


-----------------------------------------------------------------------------------
Study Design and Data Overview
-----------------------------------------------------------------------------------

- 30 Participants
	21 Training (1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30)
	9 Test (2,4,9,10,12,13,18,20,24)
- 6 Activities
	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Dependent variables:
	Triaxial Acceleration (total acceleration)
	estimated body acceleration
	Triaxial Angular velocity (gyroscope)
	561-feature vector (features.txt)
		
- Training and Test sets
	x = data set
	y = labels
	subject = participant id

-----------------------------------------------------------------------------------

1. Merge training and test sets

2. Extract measurements on the mean and standard deviation for each measurement
	Note: The instructions are not particularly clear on what it wants.
	This script includes only variables with either "mean()" or "std()" in name.

3. Relable activities with descriptive activity names

4. Label the data set with descriptive variable names

5. Create a second, independent tidy data set with average of each variable for 
   each activity and each subject (df1)
