# load up the data.  this assumes the file has already been downloaded into
# the current working directory.
powerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# just get the dates we care about
twoDayData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")

# parse the date & time
twoDayData$DateTime <- strptime(paste(twoDayData$Date, twoDayData$Time), format="%d/%m/%Y %H:%M:%S")

# create 4 plots
png("plot4.png", width=480, height=480, bg="transparent")
par(mfrow=c(2,2))

# global active power
plot(twoDayData$DateTime, twoDayData$Global_active_power, ylab="Global Active Power", xlab="", type="l")

# voltage
plot(twoDayData$DateTime, twoDayData$Voltage, type="l", ylab="Voltage", xlab="datetime")

# energy sub metering
plot(twoDayData$DateTime, twoDayData$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(twoDayData$DateTime, twoDayData$Sub_metering_1, col="black")
lines(twoDayData$DateTime, twoDayData$Sub_metering_2, col="red")
lines(twoDayData$DateTime, twoDayData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

# global reactive power
plot(twoDayData$DateTime, twoDayData$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

# close the device
dev.off()
