# Scripts for quiz of week 4

####################################

# Question 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","q1data.csv",method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf ","q1codebook",method="curl")
data <- read.csv("q1data.csv")
strsplit(colnames(data),"wgtp")[[123]]
# [1] ""   "15"

####################################

# Question 2

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv","gdpdata.csv",method = "curl")
gdp <- read.csv("gdpdata.csv",skip=4,nrows=215,stringsAsFactors = FALSE)
gdp <- tbl_df(gdp[c(1,2,4,5)])
data2 <- as.numeric(gsub(",", "", gdp$X.4))
mean(data2,na.rm=TRUE)

####################################

# Question 3
# uses objects from question 2

data3 <- grepl("^United", gdp$X.3)
summary(data3)
#    Mode   FALSE    TRUE    NA's 
# logical     212       3       0 

####################################

# Question 4
# uses objects from question 2
# grepl is used in place of grep so fiscal and june are of same length

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv","q1edudata.csv")
edu <- read.csv("q1edudata.csv")
colnames(gdp)[1] <- "countrycode"
colnames(edu)[1] <- "countrycode"
data4 <- merge(gdp, edu, by = c("countrycode"))
fiscal <- grepl("Fiscal year end", data4$Special.Notes)
june <- grepl("June", data4$Special.Notes)
table(fiscal, june)
# fiscal  FALSE TRUE
#   FALSE   175    3
#   TRUE     19   13

####################################

# Question 5

library(quantmod)
library(lubridate)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amznh)
table(year(sampleTimes))
table(year(sampleTimes),weekdays(sampleTimes))
# 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 
#  251  253  252  252  252  250  252  252  252  252  118 
#                   Answer: ^^^
#      Friday Monday Thursday Tuesday Wednesday
# 2007     51     48       51      50        51
# 2008     50     48       50      52        53
# 2009     49     48       51      52        52
# 2010     50     47       51      52        52
# 2011     51     46       51      52        52
# 2012     51   > 47 <     51      50        51
# 2013     51     48       50      52        51
# 2014     50     48       50      52        52
# 2015     49     48       51      52        52
# 2016     51     46       51      52        52
# 2017     23     21       24      25        25
