# read the data
data <- read.csv2("household_power_consumption.txt", header=TRUE, sep = ';', na.strings = "?", dec=".")
data$Datetime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
subdata <- subset(data, Datetime>strptime("2007-02-01", format="%Y-%m-%d") & Datetime<strptime("2007-02-03", format="%Y-%m-%d"), c("Datetime","Global_active_power"))
# draw histogram of global active power
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
# create plot image
dev.copy(png,file="plot1.png")
dev.off()