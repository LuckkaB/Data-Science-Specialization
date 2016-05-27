## run_analysis runs the analysis tasks
##
## @return data for means and std

run_analysis <- function() {
  # source all scripts
  source("download_data.R")
  source("clean_data.R")
  source("filter_data.R")
  
  # download the data for that assessment
  location <- download_data()
  
  # construct a meaningfull data frame containing test and train data
  data <- clean_data(location)
  
  # filter the means and std
  f_data1 <- filter_data_by_feature_type(data,"mean()")
  f_data2 <- filter_data_by_feature_type(data,"std()")
  tidy_data <- cbind(f_data1, f_data2[,3:length(f_data2)])
  
  # write to csv file
  write.csv(tidy_data, file="./tidy_data_mean_std.csv")
  
  # 2nd data set; average by label
  library(reshape2)
  variables <- colnames(data)
  byLabel <- dcast(d, activityLabel ~ variables[3:561],mean)
  bySubject <- dcast(d, subject ~ variables[3:561],mean)
  
  # summaryStats <- ddply(mergedData, .(subject_id, activity), numcolwise(mean))
  # tidydataset <- dcast(ds_meltedsubjectactivity, subject + activity ~ variable, mean)
  
  # write to csv file
  write.csv(byLabel, file="./tidy_data_avg_label.csv")
  write.csv(bySubject, file="./tidy_data_avg_subject.csv")
  
  data
}
