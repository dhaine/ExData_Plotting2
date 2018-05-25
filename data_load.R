## Downloading data if necessary.

filename <- "exdata_data_NEI_Data.zip"

if (!file.exists(filename)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl, filename)
}  
if (!file.exists("exdata_data_NEI_Data")) { 
  unzip(filename) 
}

## Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(data.table)
NEI <- as.data.table(NEI)
SCC <- as.data.table(SCC)
