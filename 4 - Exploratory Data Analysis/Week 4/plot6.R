# Load in data (in plot1.R)

# Require ggplot2
library(ggplot2)


# Subset to only the on-road sources in Baltimore, MD
baltimore.LA.cars <- subset(NEI, fips == "24510" | fips == "06037" & type == 'ON-ROAD')

# Aggregate
cars.by.Year <- aggregate(Emissions ~ year, baltimore.cars, sum)

# Plot
png('plot6.png')
ggplot(baltimore.cars.by.Year, aes(x = year, y = Emissions)) + 
  geom_line(size = 1.5) + 
  geom_point(size = 3) +
  expand_limits(y = 0) +
  ggtitle("Vehicular Emmisions in Baltimore, MD 1999 - 2008") +
  ylab(expression('Total PM'[2.5]*'')) +
  xlab("Year")
dev.off()
