# Read in data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")
 
# Subset to the dates we want because the original file is too large
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Format data
data$Global_active_power = as.numeric(data$Global_active_power)

# Plot
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
