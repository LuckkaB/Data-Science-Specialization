PeerAssessmentTidy
==================

Peer Assessments / Getting and Cleaning Data Project

Usage
=====
1. Switch to work space to the folder that contains the scripts
2. source("run_analysis.R")
3. run_analysis()

This will generate 2 files: tidy_data_mean_std and tidy_data_avg and return the whole cleaned data set.

Scripts
=======

run_analysis() use the other scripts to download the data, construct a meaningfull data frame with all features. Than the filter_data.R is used to get the data for the mean and the standard deviation. Finally the filtered data are stored in two files on the work directory.

* download_data.R: downloads the data for the analysis
* clean_data.R: creates a data frame with test and train data, meaningfull column names
* filter_data.R: to select the columns containing a specific string
* run_analysis.R: performs the analysis by using the above scripts
