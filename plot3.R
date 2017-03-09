## Load the files and create the subset for the two days
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



## Get needed data from the subset
datestimes <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3) 

## Define size and graphics device (bitmap)
png("plot3.png", width=480, height=480)

## Create the seen plot
plot(datestimes, submetering1,
     xlab = " ", 
     ylab = "Energy sub metering",
     type = "n")
lines(datestimes, submetering1, col = "black")
lines(datestimes, submetering2, col = "red")
lines(datestimes, submetering3, col = "blue")
legend("topright", pch = "-",
    legend = c("Sub_metering1","Sub_metering_2", "Sub_mereting_3"),
    col = c("black", "red", "blue"))
dev.off()

