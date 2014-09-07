
hpcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- hpcdata[min(which(hpcdata$Date == "1/2/2007")):max(which(hpcdata$Date == "2/2/2007")),]

data$Datetime <- paste(data$Date,data$Time)
data$Datetime <-strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,"%H:%M:%S")


png("Plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

# subplot 1

plot(data$Datetime,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power")

# subplot 2

plot(data$Datetime,data$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")

# subplot 3

plot(data$Datetime,data$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),lty=1,col=c("black","red","blue"))

# subplot 4

plot(data$Datetime,data$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power")

dev.off()