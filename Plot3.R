
hpcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- hpcdata[min(which(hpcdata$Date == "1/2/2007")):max(which(hpcdata$Date == "2/2/2007")),]

data$Datetime <- paste(data$Date,data$Time)
data$Datetime <-strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,"%H:%M:%S")

png("Plot3.png",width = 480, height = 480, units = "px")

plot(data$Datetime,data$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),lty=1,col=c("black","red","blue"))

dev.off()