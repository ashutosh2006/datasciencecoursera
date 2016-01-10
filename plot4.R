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

## converting as Global_reactive_power  as numeric
Global_reactive_power <- as.numeric(data$Global_reactive_power)

## converting as Voltage  as numeric
Voltage <- as.numeric(data$Voltage)


##initializing PNG
png("plot4.png", width=480, height=480)
##ploting graph

##setting panel
par(mfrow = c(2,2))

##first plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
##Second plot
plot(datetime, Voltage, type="l",  ylab="Voltage")
##Third plot
plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
points(datetime, Sub_metering_2, type="l", col="red")
points(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
##Forth plot
plot(datetime, Global_reactive_power, type="l")

dev.off()