# Load in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data necessary for plot
emissions.by.Year <- aggregate(Emissions ~ year, NEI, sum)

# Plot
png('plot1.png')
barplot(height=emissions.by.Year$Emissions, names.arg=emissions.by.Year$year, xlab="Year", ylab=expression('Total PM'[2.5]*''),main=expression('Total PM'[2.5]*' by Year 1999 - 2008'))
dev.off()