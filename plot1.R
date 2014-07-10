# load up the data.  this assumes the file has already been downloaded into
# the current working directory.
powerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# just get the dates we care about
twoDayData <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")

# plot the global active power
png("plot1.png", width=480, height=480, bg="transparent")
hist(twoDayData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
