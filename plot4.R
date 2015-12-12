#read data in to R, stored with name "power"
power<-read.table("household_power_consumption.txt",na.strings = "?",
                  sep = ";",header = TRUE)
#create DateTime column
power$DateTime<-as.POSIXct(paste(power$Date,power$Time),
                           format="%e/%m/%Y %H:%M:%S")
#subset data to incude only dates of interest
power<-power[which(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
#create and save plot as plot4.png
png(filename = "plot4.png",width = 480,height = 480,units = "px")
par(mfcol=c(2,2))
plot(power$DateTime,power$Global_active_power,type="l",
     ylab = "Global Active Power",
     xlab = "")
plot(power$DateTime,power$Sub_metering_1,type="l",
     ylab = "Energy sub metering",
     xlab = "")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
      "Sub_metering_3"),lwd = 1,col = c("black","red","blue"),bty = "n")
plot(power$DateTime,power$Voltage,type = "l",xlab = "datetime",
     ylab = "Voltage")
plot(power$DateTime,power$Global_reactive_power,type = "l",
     xlab = "datetime",ylab = "Global_reactive_power")
dev.off()