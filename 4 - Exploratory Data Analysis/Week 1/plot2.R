# Read in data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")

# Subset to the dates we want because the original file is too large
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Combine date and time, there is probably a better way
data$Combined_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot
png("plot2.png", width=480, height=480)
plot( data$Combined_time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

