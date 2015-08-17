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
  png(file = "plot2.png")
  with(selectedData, {
    date <- strptime(paste(Date, as.character(Time), sep = " "), format = "%d/%m/%Y %H:%M:%S")
    plot(date, as.numeric(as.character(Global_active_power)), ylab = "Global Active Power (kilowatts)", xlab = "", main = "", type="l")
    })
  dev.off()
}