## run_analysis runs the analysis tasks
##
## @return data for means and std

run_analysis <- function() {
  # source all scripts
  source("download_data.R")
  
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  fileName <- "household_power_consumption.txt"
  
  dataDir <- "./"
  if(!file.exists(fileName)) {
    dataDir <- download_data(url)
  }
  
  testData <- read.csv(file=paste(dataDir, fileName,sep=""), header = T, sep = ";", nrows = 100000)
  selectedData <- testData[testData$Date == "1/2/2007" | testData$Date == "2/2/2007",]
  
  # create plot
  png(file = "plot1.png")
  hist(as.numeric(as.character(selectedData$Global_active_power)), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
  dev.off()
}