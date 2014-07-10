# load up the data.  this assumes the file has already been downloaded into
# the current working directory.
powerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# just get the dates we care about
twoDayData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")

# parse the date & time
twoDayData$DateTime <- strptime(paste(twoDayData$Date, twoDayData$Time), format="%d/%m/%Y %H:%M:%S")

# plot the global active power
png("plot2.png", width=480, height=480, bg="transparent")
plot(twoDayData$DateTime, twoDayData$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
