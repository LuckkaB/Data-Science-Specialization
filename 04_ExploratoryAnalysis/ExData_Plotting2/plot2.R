## run_analysis runs the analysis tasks
##
## @return data for means and std

run_analysis <- function() {
  # source all scripts
  source("download_data.R")
  
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  fileName <- "summarySCC_PM25.rds"
  
  dataDir <- "./"
  if(!file.exists(fileName)) {
    dataDir <- download_data(url)
  }
  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  subset_data <- subset(NEI, fips == "24510")
  
  library(data.table)
  subset_data.dt <- data.table(subset_data)
  sum_emission <- subset_data.dt[, list(Emissions=sum(Emissions)), by='year']
  
  # create plot
  png(file = "plot2.png")
  with(sum_emission, {
    barplot(Emissions, ylab = "PM2.5 in tons", xlab = "year", main = "Yearly PM2.5 Emissions in Balitmore City", names.arg=year)
  })
  dev.off()
}