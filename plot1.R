#read data in to R, stored with name "power"
power<-read.table("household_power_consumption.txt",na.strings = "?",
                  sep = ";",header = TRUE)
#subset data to incude only dates of interest
power<-power[which(power$Date=="1/2/2007"|power$Date=="2/2/2007"),]
#create and save histogram as plot1.png
png(filename = "plot1.png",width = 480,height = 480,units = "px")
hist(power$Global_active_power,col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()