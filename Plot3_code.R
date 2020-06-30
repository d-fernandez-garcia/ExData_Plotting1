#Download file into local folder and unzip it
#Read data into a dataframe format

data_file <- "household_power_consumption.txt"

data <- read.delim(data_file, header = TRUE, sep =";", na.strings = c("?",""))

#Subset only the information needed

library(dplyr)

data_new <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Remove original dataframe from environment to free space

rm(data)

###Modify Date and Time into proper format

data_new$Date <- as.Date(data_new$Date, format = "%d/%m/%Y")
data_new$timetemp <- paste(data_new$Date, data_new$Time)
data_new$Time <- strptime(data_new$timetemp, format = "%Y-%m-%d %H:%M:%S")

###Present line plot (plot3) in screen device

plot(data_new$Time, data_new$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data_new$Time, data_new$Sub_metering_2, col = "red", type = "l")
lines(data_new$Time, data_new$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

#Copy to PNG device

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
