## Load the files and create the subset for the two days
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



## Get needed data from the subset
datestimes <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subsetdata$Global_active_power)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)

## Set parameters for multiplot setup
par(mfrow = c(2,2))

## Define size and graphics device (bitmap)
png("plot4.png", width=480, height=480)

## Create the seen plot)
## NEEDS TO BE EXECUTED MANUALLY
plot(datestimes, globalactivepower, type = "l", ylab = "Global Active Power")

plot(datestimes, voltage, type = "l")

plot(datestimes, submetering1, type = "l",
     xlab = " ", 
     ylab = "Energy sub metering")
lines(datestimes, submetering2, col = "red")
lines(datestimes, submetering3, col = "blue")
legend("topright", pch = "-",
       legend = c("Sub_metering1","Sub_metering_2", "Sub_mereting_3"),
       col = c("black", "red", "blue"))          
            
plot(datestimes, globalreactivepower, type = "l")

dev.off()


