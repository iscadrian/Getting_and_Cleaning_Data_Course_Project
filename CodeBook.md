#CodeBook
--------------------------------------------

Data Source
--------------------------------------------
Test data is read by creating a data frame that includes the subject, activity and features data. This is, using the cbind function subject_test.txt, y_test.txt and x_test.txt are binded in that order to create the Test Data Set. This can be done because the subject_test.txt, y_test.txt and x_test.txt have the same number of records. Same for Train data.

Once the Test Data and Train Data sets are created, they are ready to merge

Merging Test and Train Data
--------------------------------------------
all_data is the variable used to merge Test and Train data using the rbind() function

The all_data data frame contains all the features. We need only mean and sd features, so we create 2 data frames, mean_var which contains the data of all the columns that contain "mean()" on the column name and std_var which contains the data of all the columns that contain "std()" on the name.

Also, from the all_data, the Activity column has values that dont mean to much, we need to transalte the numeric values into a more meaningful value. A data frame called activity is created to do this operation. The mapping table is as following:

* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

A data frame called subject is created just to keep in a separate variable the subject values from the all_data data frame all the parts can be re-binded, the subject , the activity data frame with meaningful names and the mean and sd data frames.

The final_set is created with all these columns binded.

Tidy Data
--------------------------------------------

Finally using the aggregate function and gruping by subject and activity, the mean of all variables is calculated. The Tidy Data now has the average of all the mean and standard deviation features per subject and activity.

As an extra ste, the tidy_data is sorted by subject and activity
