#The program read the data and plots a histogram

# Reads data from file and extracts required data

inputDataFile<-"household_power_consumption.txt"
readData <- read.table(inputDataFile, header=TRUE, sep=";")
requiredData <- readData[readData$Date  %in% c("1/2/2007","2/2/2007") ,]

# Plot 

globalActPower <- as.numeric(requiredData$Global_active_power)
globalRePower <- as.numeric(requiredData$Global_reactive_power)
voltage <- as.numeric(requiredData$Voltage)
dateAndTime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(requiredData$Sub_metering_1)
subMeter2 <- as.numeric(requiredData$Sub_metering_2)
subMeter3 <- as.numeric(requiredData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(dateAndTime, globalActPower, type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(dateAndTime, voltage, type="l",xlab="datetime",ylab="Voltage")

plot(dateAndTime, subMeter1, type="l", ylab="Energy sub metering", xlab="")
lines(dateAndTime, subMeter2, type="l", col="red")
lines(dateAndTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1,col=c("black", "red", "blue"))

plot(dateAndTime, globalRePower, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()