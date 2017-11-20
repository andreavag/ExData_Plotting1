## Set YOUR working directory with the txt file!

setwd("C:\\Users\barca\\Desktop\\DATA SCIENCE\\Data Science John Hopkins\\Exploratory Data Analysis Course 4\\Electric power week 1")

## Read the file subset and do necessary conversions.

house <- read.table("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",  stringsAsFactors = F)
house2 <- subset(house, house$Date == "1/2/2007" | house$Date == "2/2/2007" )
house2$Date <- as.Date(house2$Date, format ="%d/%m/%y")
houseDT <- paste(house2$Date, house2$Time)
house2$newDate <- as.POSIXct(houseDT)

# Plot the graph

par(mar = c(7,4,6,2), mfrow = c(1,1))
with(house2, plot(Global_active_power ~ newDate, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#Save to png

dev.copy(png, "plot2.png")
dev.off()

