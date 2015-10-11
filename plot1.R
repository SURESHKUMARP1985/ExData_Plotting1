#The program read the data and plots a histogram

# Reads data from file and extracts required data

inputDataFile<-"household_power_consumption.txt"
readData <- read.table(inputDataFile, header=TRUE, sep=";")
requiredData <- subset(readData,Date  %in% c("1/2/2007","2/2/2007"))



# Plot the histogram

globalActPower <- as.numeric(requiredData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()