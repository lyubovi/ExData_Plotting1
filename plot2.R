data <- read.csv2("household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", dec=".")
data$Datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
subdata <- subset(data, Datetime>strptime("2007-02-01", format="%Y-%m-%d") & Datetime<strptime("2007-02-03", format="%Y-%m-%d"), c("Datetime","Global_active_power"))
#drawing line plot of Global active power
png(filename="plot2.png")
plot(subdata$Datetime, subdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()