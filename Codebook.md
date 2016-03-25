##This file is the description of the steps performed in run_analysis.R file. 
### The project asks us to perform 5 steps which are the following :
* 1.Merges the training and the test sets to create one data set.
* 2.Extracts only the measurements on the mean and standard deviation for each measurement.
* 3.Uses descriptive activity names to name the activities in the data set
* 4.Appropriately labels the data set with descriptive variable names.
* 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Given below are the methods I used to impliment the tasks.
* With the help of Rbind() I merged all data into "all". 
* Filtering data is done on the basis of Mean and Standard Vairance with the help of the function Grep and (mean|std), followed by correcting the names.
* After Subsetting the Mean and Std values, correction of the column names to "activity" and "subject" is done. 
* Using Cbind, merging of all data from the 3 different tables is donr into "all"
* Using a ddply function I took the averages and saved in "avg_data". I have used colmeans for this execution. 

## Variables that I have used
* 'Xtrain', 'Ytrain', 'Subtrain', 'Xtest', 'Ytest', 'subtest', features, which contain the files. 
* 'Xdata', 'Ydata', 'Subdata' contains the merged files. 
* 'MSD' contains the mean and standard deviation values.
* 'all' contaims merged data. 
* 'avd_data' contains the averages. 
*  average values are stored in 'averages_data.txt' in  text format

