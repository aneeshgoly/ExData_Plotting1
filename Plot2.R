
hpcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- hpcdata[min(which(hpcdata$Date == "1/2/2007")):max(which(hpcdata$Date == "2/2/2007")),]

data$Datetime <- paste(data$Date,data$Time)
data$Datetime <-strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,"%H:%M:%S")

png("Plot2.png",width = 480, height = 480, units = "px")

plot(data$Datetime,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()