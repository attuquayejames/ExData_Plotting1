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
png(filename = "plot2.png", width = 480, height = 480)
# generate plot2
plot(mydata$weekdays, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
dev.off()


