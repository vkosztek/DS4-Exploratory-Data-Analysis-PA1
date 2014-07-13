## load the dataset library to draw plots
library(datasets)

## download and unzip household_power_consumption.txt datafile under Windows 8 
## into working directory
getFile <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"        
        download.file(fileUrl, "hpc.zip")
        unzip("hpc.zip")
        
        
}
## required memory for the hole file as a loaded dataset ~ 1.3 Mbyte
loadData <- function() {
        if(!file.exists("household_power_consumption.txt")) {
                getFile()
        }
        
        
        largePowerData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
        
        
        day1 <- largePowerData$Date == "1/2/2007"
        day2 <- largePowerData$Date == "2/2/2007"
        days <- day1 + day2
        
        days <- as.logical(days)
        
        
        
        
        smallData <<- largePowerData[days, ]
        
}

getPlot <- function() {
        
        if(!exists("smallData")) {
                loadData()
        }
        png("plot1.png", width=480, height=480)
        hist(smallData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
        dev.off()
}
