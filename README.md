# Getting and Cleaning Data Course Project

Introduction
------------------------------------------

This is the final project of Getting and Cleaning. In this repository you will find the script developed according to the instructions described in the cours project


Data Source
------------------------------------------

The raw data comes from UCI HAR Data Set. Which is composed by the following files:

Markup : * Test Measures Data (x_test.txt)
         * Activity Test Data (y_test.txt
         * Subject Test Data  (subject_test.txt)
         * Train Measures Data (x_train.txt)
         * Activity Train Data (y_train.txt)
         * Subject Train Data (subject_train.txt)

There are Inertial Signal folders that contains complimentary data, however we are not using is for this project


* Bullet list
    * Nested bullet
        * Sub-nested bullet etc
* Bullet list item 2

~~~
 Markup : * Bullet list
              * Nested bullet
                  * Sub-nested bullet etc
          * Bullet list item 2
~~~

The Script
------------------------------------------
The script created to load and transform the data is called course_project.R. In order to execute this script, the raw data should be extracted in the same directory as the script

Once loaded and processed the data, the script will write a file in the same directory containing the tidy data set


The Tidy Data Set
------------------------------------------

It represents the Average of Means and Standard Deviations for each subject and activity
