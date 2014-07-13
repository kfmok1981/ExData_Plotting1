# Get the header of the data set
data <- read.table("household_power_consumption.txt", TRUE,";", nrows = 10)
colnames <- colnames(data)

# Read only the data from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", FALSE,";" , nrows = 2880, skip = 66637)
colnames(data) <- colnames

# Generate the png file
png(file="plot1.png")
with(data,hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",  col = "red"))
dev.off()