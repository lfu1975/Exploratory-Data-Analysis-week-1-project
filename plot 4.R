library(dplyr)
library(lubridate)


#read tables from unzipped folder
power <- read.table("./household_power_consumption.txt",stringsAsFactors = FALSE, header=TRUE,sep=";")

#merge data and time into a new column named"data_time"
power$date_time <-dmy_hms(paste(power$Date,power$Time))

#change Date column to Date class
power$Date <- dmy(power$Date)

#change Time column to time class
power$Time <- hms(power$Time)


#change remaining columns to numeric
id = 3:8
power[id] <- data.matrix(power[id])

#select dataset of 2 days of 2007 Feb
power2007 <- subset(power,Date =="2007-02-01" | Date =="2007-02-02")

#create plot3 as scatter plot with lines
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plot 1
with(power2007,plot(date_time, Global_active_power,type="l",xlab="",ylab="Global Active Power"))

#plot2 
with(power2007,plot(date_time, Voltage,type="l",xlab="datetime",ylab="Voltage"))

#plot 3
with(power2007,plot(date_time, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(power2007$date_time, power2007$Sub_metering_2,col="red")
lines(power2007$date_time, power2007$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

#plot 4
with(power2007,plot(date_time, Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()