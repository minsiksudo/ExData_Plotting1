#New project.
getwd()
list.files()
data<-read.table("household_power_consumption.txt", sep = ";", header = T)
#Changing format of dates
data$Date<-as.Date(data$Date, tryFormat = c("%d/%m/%Y"))
data$Date>"2007-02-01"
#subsetting targetted dates
data<-subset(data, data$Date > "2007-01-31"& data$Date < "2007-02-03")
dtimes<-paste(data$Date,data$Time)
dtimes
strtime(dtimes)
dtimes<-strptime(dtimes, format ='%Y-%m-%d %H:%M:%S')
data$dtimes<-dtimes
data$Global_active_power<-as.numeric(data$Global_active_power)
summary(data$Global_active_power)
#Plot1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power)
dev.off()
#Plot2
png("plot2.png", width = 480, height = 480)
plot(data$dtimes, data$Global_active_power, type = "l",xlab = "days", ylab = "Global Active Power (kilowatts)")
dev.off()
#axis(1, at=c, labels = c("Thu","Fri","Sat"))

#plot3
png("plot3.png", width = 480, height = 480)
plot(data$dtimes, data$Sub_metering_1, type = "l", col = 1)
lines(data$dtimes,data$Sub_metering_2, type = "l", col=2)
lines(data$dtimes, data$Sub_metering_3, type = "l", col=3)
legend("topright", legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c(1,2,3), lty=1:2, cex=0.8)
dev.off()
#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(data$dtimes, data$Global_active_power, type = "l")
plot(data$dtimes, data$Voltage, type = "l")
plot(data$dtimes, data$Voltage, type = "l")
plot(data$dtimes, data$Sub_metering_1, type = "l", col = 1)
lines(data$dtimes,data$Sub_metering_2, type = "l", col=2)
lines(data$dtimes, data$Sub_metering_3, type = "l", col=3)
legend("topright", legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c(1,2,3), lty=1:2, cex=0.8)
dev.off()

# Plot 4 was edited
