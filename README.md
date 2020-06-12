==================================================================

Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

==================================================================


The Repository contains following files:

1. README.md

2. run_analysis.R   
It is the R script which creates the Tidy dataset required for this assignment.   
The script initially loads the original data having separate train and test datasets. The datasets are then allocated appropriate Activity labels and Feature names. All the datasets are merged to create one dataset.  
Then only the features containing mean and standard deviation for each measurement are extracted. The final dataset is created by grouping observations based on Activity and Subject in that order and calculating mean of each variable for each activity and each subject. 


2. CodeBook.md   
This is the Code Book for the Tidy Dataset describing its contents.

==================================================================

The Tidy Dataset:  
The dataset contains 180 observations(rows) of 68 variables(columns). It is the subset of "Human Activity Recognition Using Smartphones" Dataset. The observations were done by monitoring various subjects performing different activities.    
The features in this datasets are subset of features in the original dataset. For this dataset only the features containing mean and standard deviation measurements are selected.