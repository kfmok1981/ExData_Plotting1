# Get the header of the data set
data <- read.table("household_power_consumption.txt", TRUE,";", nrows = 10)
colnames <- colnames(data)

# Read only the data from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", FALSE,";" , nrows = 2880, skip = 66637)
colnames(data) <- colnames

# Store the datetime variable
datetime <- strptime(with(data, paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")

# Generate the png file
png(file="plot2.png")
plot(datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()