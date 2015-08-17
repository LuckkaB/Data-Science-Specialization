## download_data downloads the data for the assignment
##
## @return location of the unzip data

download_data <- function(url) {
  if(!file.exists("data")) {
    dir.create("data")
  }
  download.file(url, destfile="./data/data.zip", method="curl")
  dateDownloaded <- date()
  unzip("./data/data.zip")
  location <- "./"
  location
}
