#read data in to R, stored with name "power"
power<-read.table("household_power_consumption.txt",na.strings = "?",
                  sep = ";",header = TRUE)
#create DateTime column
power$DateTime<-as.POSIXct(paste(power$Date,power$Time),
                           format="%e/%m/%Y %H:%M:%S")
#subset data to incude only dates of interest
power<-power[which(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
#create and save plot as plot2.png
png(filename = "plot3.png",width = 480,height = 480,units = "px")
plot(power$DateTime,power$Sub_metering_1,type="l",
     ylab = "Energy sub metering",
     xlab = "")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
     "Sub_metering_3"),lwd = 1,col = c("black","red","blue"))
dev.off()