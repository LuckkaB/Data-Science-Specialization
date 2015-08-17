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
  
  if(!file.exists("named_NEI.Rda")) {
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    names <- subset(SCC, select = c("SCC", "Short.Name"))
    named_NEI <- merge(NEI, names, by.x="SCC", by.y="SCC", all=TRUE)    
  } else {
    namedNEI <- load("named_NEI.Rda")
  }
  
  subset_data <- subset(named_NEI, grepl("Coal", named_NEI$Short.Name))
    
  library(data.table)
  subset_data.dt <- data.table(subset_data)
  sum_emission <- subset_data.dt[, list(Emissions=sum(Emissions)), by='year']
  
  # create plot
  png(file = "plot4.png")
  library(ggplot2)
  with(sum_emission, {
    qplot(year, Emissions, ylab = "PM2.5 in tons", xlab = "year", main = "Yearly PM2.5 Emissions from coal", geom = c("point", "smooth"), method = "lm")
  })
  dev.off()
}