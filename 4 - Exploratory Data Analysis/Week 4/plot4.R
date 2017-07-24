# Load in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Require ggplot2
library(ggplot2)

# Pull SCC's for emissions from coal combustion-related sources
coal.SCC <- subset(SCC, EI.Sector == "Fuel Comb - Electric Generation - Coal")
SCCs <- factor(coal.SCC$SCC)

# Subset to only the coal
coal.data <- subset(NEI, SCC %in% SCCs)

# Aggregate
coal.by.Year <- aggregate(Emissions ~ year, coal.data, sum)

# Plot
png('plot4.png')
ggplot(coal.by.Year, aes(x = year, y = Emissions)) + 
  geom_line(size = 1.5) + 
  geom_point(size = 3, fill = "white") +
  expand_limits(y = 0) +
  ggtitle("Coal Combustion Emissions in America 1999 - 2008") +
  ylab(expression('Total PM'[2.5]*'')) +
  xlab("Year")
dev.off()
