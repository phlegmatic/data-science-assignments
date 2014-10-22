#Getting and Cleaning Data Course Project
#Author : Sanket
++++++++++++++++++++++++++++++++++++++++++

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. 

#Background
One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course website represent
data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 

1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names. 
5.    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Contents of this repository

* CodeBook.md: information about raw dataset,tidy dataset and transformation process on raw data
* README.md: information about project
* run_analysis.R: R script to transform raw data set in a tidy one

## How to create the tidy data set
1. clone this repository: `https://github.com/phlegmatic/data-science-assignments.git`
2. download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory
4. open a R console and set the working directory where run_analysys.R and`UCI HAR Dataset` directory exists
5. source run_analysys.R script (it requires the plyr package): `source('run_analysis.R')`

In the repository root directory you find the file `TidycombinedTestTrainData.txt` with the tidy data set.
You can also view the tidy data by executing "View(TidycombinedTestTrainData)" command in R 

