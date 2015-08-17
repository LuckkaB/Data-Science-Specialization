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
  png(file = "plot4.png")
  par(mfrow=c(2,2))
  date <- strptime(paste(selectedData$Date, as.character(selectedData$Time), sep = " "), format = "%d/%m/%Y %H:%M:%S")
  with(selectedData, {
    plot(date, as.numeric(as.character(Global_active_power)), ylab = "Global Active Power (kilowatts)", xlab = "", main = "", type="l")
  })
  
  with(selectedData, {
    plot(date, as.numeric(as.character(Voltage)), ylab = "Voltage", xlab = "datetime", main = "", type="l")
  })
  
  with(selectedData, {
    plot(date, as.numeric(as.character(Sub_metering_1)), ylab = "Energy sub metering", xlab = "", main = "", type="l")
    })
  with(selectedData, lines(date, as.numeric(as.character(Sub_metering_2)), type="l", col="red"))
  with(selectedData, lines(date, as.numeric(as.character(Sub_metering_3)), type="l", col="blue"))
  legend("topright", bty = "n", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(selectedData, {
    plot(date, as.numeric(as.character(Global_reactive_power)), ylab = "Global_reactive_power", xlab = "datetime", main = "", type="l")
  })
  
  dev.off()
}