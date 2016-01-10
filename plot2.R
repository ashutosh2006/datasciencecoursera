## loading data
houseData <- read.csv("household_power_consumption.txt", 
                      sep=";", stringsAsFactors=FALSE, dec=".", header = TRUE)
## filtering data for dates
data <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007") ,]
## converting as Global Active Power as numeric
globalActivePower <- as.numeric(data$Global_active_power)
## converting datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##initializing PNG
png("plot2.png", width=480, height=480)
##ploting graph
plot(datetime, globalActivePower, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()