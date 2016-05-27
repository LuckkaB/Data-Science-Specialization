## filter_data_by_feature_type extracts the data by features type (e.g. mean, std, ...)
##
## @param data frame
## @param type as string
## @return filtered data

filter_data_by_feature_type <- function(data, filter_type) {
  # get the index for which the colmun name contains the filter type
  col_names <- colnames(data)
  idx <- which(grepl(filter_type,col_names))
  
  # return the filtered data (with the label column)
  data[,c(1,2,idx)]
}