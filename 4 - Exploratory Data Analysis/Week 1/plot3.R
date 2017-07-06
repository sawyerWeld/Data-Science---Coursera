# Read in data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")

# Subset to the dates we want because the original file is too large
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Combine date and time, there is probably a better way
data$Combined_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot
png("plot3.png", width=480, height=480)
with(data, {plot(Combined_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(Combined_time, Sub_metering_2,col='Red')
  lines(Combined_time, Sub_metering_3,col='darkorchid4')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex = 1, xjust = 1,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
