## loading data
houseData <- read.csv("household_power_consumption.txt", 
                      sep=";", stringsAsFactors=FALSE, dec=".", header = TRUE)
## filtering data for dates
data <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007") ,]
## converting as Global Active Power as numeric
globalActivePower <- as.numeric(data$Global_active_power)
##initializing PNG
png("plot1.png", width=480, height=480)
##ploting graph
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()