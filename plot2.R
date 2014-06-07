## This R program reads the data file "household_power_consumption.txt",
## selects the data between 1/2/2007 and 2/2/2007 and then
## print the Plot2.

csvName <- paste("household_power_consumption.txt", sep = ";")

library(data.table)
powerData <- fread(csvName)[Date == "1/2/2007" | Date == "2/2/2007"]

## Output the plot to "plot2.png"
png("plot2.png")

## Make the Plot2
with(powerData, 
     plot(strptime(paste(Date, Time), 
                   format="%d/%m/%Y %H:%M:%S"), 
          as.numeric(Global_active_power), 
     type = "l",
     xlab = " ", 
     ylab = "Global Active Power (kilowatts)"))

dev.off()