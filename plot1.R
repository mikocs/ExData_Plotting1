## this script generates the first plot in the course project
## the function generates a PNG file named plot1.png with the required plot

plot1 <- function() {
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
        
        png(filename = 'plot1.png')
        hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
             main = "Global Active Power", col = "red")
        dev.off()
}