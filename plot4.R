# read the data
data <- read.csv2("household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", dec=".")
data$Datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subdata <- subset(data, Datetime>strptime("2007-02-01",format="%Y-%m-%d") & Datetime<strptime("2007-02-03", format="%Y-%m-%d"),c("Datetime","Sub_metering_1","Sub_metering_2","Sub_metering_3","Global_active_power","Global_reactive_power","Voltage"))


png(filename="plot4.png")

# set layout for plots
par(mfrow=c(2,2))

# top left plot
plot(subdata$Datetime, subdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# top right plot
plot(subdata$Datetime, subdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

# bottom left plot
plot(subdata$Datetime, subdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

lines(subdata$Datetime, subdata$Sub_metering_1, col="black")
lines(subdata$Datetime, subdata$Sub_metering_2, col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, col="blue")

# bottom right plot
plot(subdata$Datetime, subdata$Global_reactive_power, type="l", xlab="datetime")

# legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n", col=c("black","red","blue"))

dev.off()