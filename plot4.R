# read the data 
mydata <- read.table("household_power_consumption.txt", header=T, sep=";")
# convert the Date variable to Date classes in R using the as.Date() function
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
# subset the data
mydata <- mydata[(mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02"), ]
# convert the Global_active_power variable to numeric class in R
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
# transform timestamps to weekdays
mydata <- transform(mydata, weekdays=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# transform Sub_metering variables to numeric variables
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))
png(filename = "plot4.png", width = 480, height = 480)
# generate plot4
par(mfrow=c(2,2))
plot(mydata$weekdays, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(mydata$weekdays, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(mydata$weekdays, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$weekdays, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$weekdays, mydata$Sub_metering_3, type="l", col="blue")
# add legend to the plot
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), bty="n", cex=.5)
plot(mydata$weekdays, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()



