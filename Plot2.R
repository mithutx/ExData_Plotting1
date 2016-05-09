setwd("C:/LocalTraining/DataScience/ExploratoryDataAnalysis/Assignments/Assignment1")

if (!file.exists("data")){
  dir.create("data")
}
datafile <- './data/household_power_consumption.txt'
#dt <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", na.strings = '?')
dt <- read.table(text = grep("^[1,2]/2/2007",readLines(datafile),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot2
dt$Date <- as.Date(dt$Date, format = '%d/%m/%Y')
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time))
devicefile = './data/plot2.png'
png(filename = devicefile, width = 480, height = 480, units='px')
plot(dt$DateTime, dt$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()

