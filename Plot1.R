
hpcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

data <- hpcdata[min(which(hpcdata$Date == "1/2/2007")):max(which(hpcdata$Date == "2/2/2007")),]

data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time,"%H:%M:%S")

png("Plot1.png",width = 480, height = 480, units = "px")

hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()