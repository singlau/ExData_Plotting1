## This R program reads the data file "household_power_consumption.txt",
## selects the data between 1/2/2007 and 2/2/2007 and then
## print the Plot 1 histogram.

library(data.table)
csvName <- paste("household_power_consumption.txt", sep = ";")

powerData <- fread(csvName)[Date == "1/2/2007" | Date == "2/2/2007"]

## Plot 1

## Output the histogram to "plot1.png"
png("plot1.png")

## Plot the histogram
hist(as.numeric(powerData$Global_active_power), col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)")

dev.off()
