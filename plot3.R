## This R program reads the data file "household_power_consumption.txt",
## selects the data between 1/2/2007 and 2/2/2007 and then
## print the Plot3.

csvName <- paste("household_power_consumption.txt", sep = ";")

library(data.table)
powerData <- fread(csvName)[Date == "1/2/2007" | Date == "2/2/2007"]

## Output the plot to "plot3.png"
png("plot3.png")

## Make the plot3

with(powerData, 
     plot(strptime(paste(Date, Time), 
                   format="%d/%m/%Y %H:%M:%S"), 
          as.numeric(Sub_metering_1), 
          type = "l",
          xlab = " ", 
          ylab = "Energy sub metering"))

lines(strptime(paste(powerData$Date, powerData$Time), 
               format="%d/%m/%Y %H:%M:%S"), 
      as.numeric(powerData$Sub_metering_2), col = "red")

lines(strptime(paste(powerData$Date, powerData$Time), 
               format="%d/%m/%Y %H:%M:%S"), 
      as.numeric(powerData$Sub_metering_3), col = "blue")

legend("topright", lty= c(1,1), col = c("black", "red", "blue"),
        legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))

dev.off()