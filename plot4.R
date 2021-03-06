# Get the header of the data set
data <- read.table("household_power_consumption.txt", TRUE,";", nrows = 10)
colnames <- colnames(data)

# Read only the data from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", FALSE,";" , nrows = 2880, skip = 66637)
colnames(data) <- colnames

# Store the datetime variable
datetime <- strptime(with(data, paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")

# Generate the png file
png(file="plot4.png")

par(mfrow = c(2, 2))

plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, data$Voltage, type = "l", ylab = "Voltage")

plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = "l", col = "Red")
lines(datetime, data$Sub_metering_3, type = "l", col = "Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), col = c("Black","Red","Blue"))

plot(datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

dev.off()