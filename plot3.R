#The program read the data and plots a histogram

# Reads data from file and extracts required data

inputDataFile<-"household_power_consumption.txt"
readData <- read.table(inputDataFile, header=TRUE, sep=";")
requiredData <- subset(readData,Date  %in% c("1/2/2007","2/2/2007"))


# Plot 


dateAndTime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(requiredData$Sub_metering_1)
subMeter2 <- as.numeric(requiredData$Sub_metering_2)
subMeter3 <- as.numeric(requiredData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(dateAndTime, subMeter1, type="l", ylab="Energy sub metering", xlab="")
lines(dateAndTime, subMeter2, type="l", col="red")
lines(dateAndTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1,col=c("black", "red", "blue"))
dev.off()