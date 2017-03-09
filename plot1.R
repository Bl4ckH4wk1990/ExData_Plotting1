## Load the files and create the subset for the two days
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]



## Get needed data from the subset
globalactivepower <- as.numeric(subsetdata$Global_active_power)

## Define size and graphics device (bitmap)
png("plot1.png", width=480, height=480)

## Create the seen histogram
hist(globalactivepower, 
     main = "Global Active Power",
     xlab = " Global Active Power (kilowatts)", 
     col = "red")
dev.off()

