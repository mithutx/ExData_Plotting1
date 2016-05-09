setwd("C:/LocalTraining/DataScience/ExploratoryDataAnalysis/Assignments/Assignment1")


if (!file.exists("data")){
  dir.create("data")
}

dataUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(dataUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

datafile <- './data/household_power_consumption.txt'
#dt <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", na.strings = '?')
dt <- read.table(text = grep("^[1,2]/2/2007",readLines(datafile),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot1
devicefile = './data/plot1.png'
png(filename = devicefile, width = 480, height = 480, units='px')
with(dt, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()
