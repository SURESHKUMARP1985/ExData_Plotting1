#The program read the data and plots a histogram

# Reads data from file and extracts required data

inputDataFile<-"household_power_consumption.txt"
readData <- read.table(inputDataFile, header=TRUE, sep=";")
requiredData <- subset(readData,Date  %in% c("1/2/2007","2/2/2007"))


# Plot 

globalActPower <- as.numeric(requiredData$Global_active_power)
dateAndTime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(dateAndTime, globalActPower, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()