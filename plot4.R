## this script generates the fourth plot in the course project
## the function generates a PNG file named plot4.png with the required plot


plot4 <- function() {
        if (!file.exists('household_power_consumption.txt')) {
                if (!file.exists('household_power_consumption.zip')) {
                        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                        download.file(fileURL, destfile = "household_power_consumption.zip")
                }
                unzip('household_power_consumption.zip')
        }
        
        data <- read.table('household_power_consumption.txt', na.strings = "?", header = TRUE, sep=";", 
                                                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        
        data <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
        data$Date <- strptime(data$Date, "%d/%m/%Y")
        data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

        png(filename = 'plot4.png')
        par(mfrow = c(2,2))
        plot(x = data$Time, y = data$Global_active_power, 
             ylab = "Global Active Power", type = "n", xlab = "")
        lines(x = data$Time, y = data$Global_active_power)
        plot(x = data$Time, y = data$Voltage, ylab = "Voltage", xlab = "datetime", 
             type = "n")
        lines(x = data$Time, y = data$Voltage)
        plot(x = data$Time, y = data$Sub_metering_1, xlab = "", 
             ylab = "Energy sub metering", type = 'n')
        lines(x = data$Time, y = data$Sub_metering_1, col = 'black')
        lines(x = data$Time, y = data$Sub_metering_2, col = 'red')
        lines(x = data$Time, y = data$Sub_metering_3, col = 'blue')
        legend("topright", col = c('black', 'red', 'blue'), 
               legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
               lty = 1, bty = 'n')
        plot(x = data$Time, y = data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
        lines(x = data$Time, y = data$Global_reactive_power)
        dev.off()
}