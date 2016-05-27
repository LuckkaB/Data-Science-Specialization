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
  
  subset_data <- subset(NEI, (fips == "24510" | fips == "06037") & type =="ON-ROAD")
  subset_data$fips <- factor(subset_data$fips, levels=c("24510", "06037"), labels=c("Baltimore City", "LA County"))
  
  library(data.table)
  subset_data.dt <- data.table(subset_data)
  sum_emission <- subset_data.dt[, list(Emissions=sum(Emissions)), by=c('year', 'fips')]
  
  # create plot
  png(file = "plot6.png")
  library(ggplot2)
  ggplot(data = sum_emission, aes(x=year, y=Emissions, group=fips, color=fips)) + geom_point() + geom_smooth() + ggtitle("Emissions from motor vehicle sources: Balitmore vs LA") + ylab("PM2.5 in tons")

  dev.off()
}