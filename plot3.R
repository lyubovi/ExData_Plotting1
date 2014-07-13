# read the data
data <- read.csv2("household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", dec=".")
data$Datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subdata <- subset(data, Datetime>strptime("2007-02-01", format="%Y-%m-%d") & Datetime<strptime("2007-02-03", format="%Y-%m-%d"), c("Datetime","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# draw  plot
png(filename="plot3.png")
plot(subdata$Datetime, subdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

# add line plots for each sub metering with proper color
lines(subdata$Datetime, subdata$Sub_metering_1, col="black")
lines(subdata$Datetime, subdata$Sub_metering_2, col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, col="blue")

# add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()