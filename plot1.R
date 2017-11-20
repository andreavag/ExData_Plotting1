## Set YOUR working directory with the txt file!

setwd("C:\\Users\barca\\Desktop\\DATA SCIENCE\\Data Science John Hopkins\\Exploratory Data Analysis Course 4\\Electric power week 1")

## Read the file and subset 2 dates necessary dates in February 2007

house <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
house2 <- subset(house, house$Date == "1/2/2007" | house$Date == "2/2/2007" )

## Plot Histogram for plot1

par(mar = c(5,7,4,5), mfrow = c(1,1))
hist(house2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save to PNG file "plot1.png"

dev.copy(png, file = "plot1.png")
dev.off()
