## download_data downloads the data for the assignment
##
## @return location of the unzip data

download_data <- function() {
  if(!file.exists("data")) {
    dir.create("data")
  }
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile="./data/data.zip", method="curl")
  dateDownloaded <- date()
  unzip("./data/data.zip")
  location <- "./UCI HAR Dataset/"
  location
}
