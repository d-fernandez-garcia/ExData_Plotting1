#Download file into local folder and unzip it
#Read data into a dataframe format

data_file <- "household_power_consumption.txt"

data <- read.delim(data_file, header = TRUE, sep =";", na.strings = c("?",""))

#Subset only the information needed

library(dplyr)

data_new <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Remove original dataframe from environment to free space

rm(data)

###Present hist (plot1) in screen device

hist(data_new$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global active power (kilowatts)")

#Copy to PNG device

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
