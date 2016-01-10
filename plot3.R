## loading data
houseData <- read.csv("household_power_consumption.txt", 
                      sep=";", stringsAsFactors=FALSE, dec=".", header = TRUE)
## filtering data for dates
data <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007") ,]

## converting datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## converting as Sub_metering  as numeric
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

##initializing PNG
png("plot3.png", width=480, height=480)
##ploting graph
plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
points(datetime, Sub_metering_2, type="l", col="red")
points(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()