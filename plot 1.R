library(dplyr)
library(lubridate)

#read tables from unzipped folder
power <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE, header=TRUE,sep=";")

#change Date column to Date class
power$Date <- dmy(power$Date)

#change columns to numeric
id = 3:8
power[id] <- data.matrix(power[id])
power2007 <- subset(power,Date =="2007-02-01" | Date =="2007-02-02"

png("plot1.png", width=480, height=480)
hist(power2007$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()