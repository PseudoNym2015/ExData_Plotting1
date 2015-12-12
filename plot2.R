#read data in to R, stored with name "power"
power<-read.table("household_power_consumption.txt",na.strings = "?",
                  sep = ";",header = TRUE)
#create DateTime column
power$DateTime<-as.POSIXct(paste(power$Date,power$Time),
                  format="%e/%m/%Y %H:%M:%S")
#subset data to incude only dates of interest
power<-power[which(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
#create and save plot as plot2.png
png(filename = "plot2.png",width = 480,height = 480,units = "px")
plot(power$DateTime,power$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()