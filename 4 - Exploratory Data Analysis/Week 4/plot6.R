# Load in data (in plot1.R)

# Require ggplot2
library(ggplot2)


# Subset to only the on-road sources in Baltimore, MD
baltimore.LA.cars <- subset(NEI, fips == "24510" | fips == "06037" & type == 'ON-ROAD')

# Aggregate
cars.by.Year <- aggregate(Emissions ~ year + fips, baltimore.LA.cars, sum)

# Make data more presentable
cars.by.Year[cars.by.Year=="06037"] <- "Los Angeles"
cars.by.Year[cars.by.Year=="24510"] <- "Baltimore"
colnames(cars.by.Year) <- c("Year", "City", "Emissions")

# Plot
png('plot6.png')
ggplot(cars.by.Year, aes(x = Year, y = Emissions, group = City, colour = City)) + 
  geom_line(size = 1.5) + 
  geom_point(size = 3) +
  expand_limits(y = 0) +
  ggtitle("Vehicular Emmisions in Baltimore, MD and Los Angeles, Ca 1999 - 2008") +
  ylab(expression('Total PM'[2.5]*' in tons')) +
  xlab("Year")
dev.off()
