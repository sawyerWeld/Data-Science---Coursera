# Load in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Require ggplot2
library(ggplot2)

# Subset Baltimore data
baltimore.Data <- subset(NEI, fips == "24510")

# Aggregate data necessary for plot
baltimore.by.Year.Type <- aggregate(Emissions ~ year + type, baltimore.Data, sum)

# Plot
png('plot3.png')
ggplot(baltimore.by.Year.Type, aes(x=year, y=Emissions, colour=type)) +
  geom_line(size = 2) + 
  geom_point() +
  ggtitle("Emmisions in Baltimore, MD by Source")
dev.off()
