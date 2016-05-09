setwd("C:/LocalTraining/DataScience/ExploratoryDataAnalysis/Assignments/Assignment1")

if (!file.exists("data")){
  dir.create("data")
}
datafile <- './data/household_power_consumption.txt'
#dt <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", na.strings = '?')
dt <- read.table(text = grep("^[1,2]/2/2007",readLines(datafile),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot3
devicefile = './data/plot3.png'
png(filename = devicefile, width = 480, height = 480, units='px')
dt$Date <- as.Date(dt$Date, format = '%d/%m/%Y')
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time))
plot(dt$DateTime, dt$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(dt$DateTime, dt$Sub_metering_2, col = 'red')
lines(dt$DateTime, dt$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()

