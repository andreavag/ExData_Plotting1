## Set YOUR working directory with the txt file!

setwd("C:\\Users\barca\\Desktop\\DATA SCIENCE\\Data Science John Hopkins\\Exploratory Data Analysis Course 4\\Electric power week 1")

## Read the file subset and do necessary conversions.

house <- read.table("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",  stringsAsFactors = F)
house2 <- subset(house, house$Date == "1/2/2007" | house$Date == "2/2/2007" )
house2$Date <- as.Date(house2$Date, format ="%d/%m/%y")
houseDT <- paste(house2$Date, house2$Time)
house2$newDate <- as.POSIXct(houseDT)

#Set parametres
par(mfcol = c(2,2), mar = c(4,4,4,4))

#Plot1
with(house2, plot(Global_active_power ~ newDate, type = "l", xlab = "", ylab = "Global Active Power"))

#Plot2
  plot(house2$Sub_metering_1 ~   house2$newDate, type = "l", xlab = "", ylab = "Energy sub metering")
points(house2$Sub_metering_2 ~ house2$newDate, col = "red", type = "l")
points(house2$Sub_metering_3 ~ house2$newDate, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), lwd = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.75 )

#Plot3
plot(house2$Voltage ~ house2$newDate, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot4

plot(house2$Global_reactive_power ~ house2$newDate, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Save to png

dev.copy(png, "plot4.png")
dev.off()
