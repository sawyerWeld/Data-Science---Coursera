# Load in data (in plot1.R)

# Subset Baltimore data
baltimore.Data <- subset(NEI, fips == "24510")

# Aggregate data necessary for plot
baltimore.by.Year <- aggregate(Emissions ~ year, baltimore.Data, sum)

# Plot
png('plot2.png')
with(baltimore.by.Year,
     barplot(height = Emissions, names.arg = year, xlab = "Year", ylab = expression('Total PM'[2.5]*''), main = "Emissions in Baltimore, MD")
     )
dev.off()