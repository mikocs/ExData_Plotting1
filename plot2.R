## this script generates the second plot in the course project
## the function generates a PNG file named plot2.png with the required plot

plot2 <- function() {
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
        
        png(filename = 'plot2.png')
        plot(x = data$Time, y = data$Global_active_power, type = "n", 
             xlab = "", ylab = "Global Active Power (kilowatts)")
        lines(x= data$Time, y = data$Global_active_power)
        dev.off()
}