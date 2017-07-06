# Read in data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = ".")

# Subset to the dates we want because the original file is too large
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Combine date and time, there is probably a better way
data$Combined_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Plot

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,0,0))
with(data, {

  plot(Combined_time, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    
  plot(Combined_time, Voltage, type="l", ylab="voltage", xlab="datetime")
  
  plot(Combined_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(Combined_time, Sub_metering_2,col='Red')
  lines(Combined_time, Sub_metering_3,col='darkorchid4')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = 'n' ,cex = .7, xjust = 1,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Combined_time, Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime")
})
dev.off()
