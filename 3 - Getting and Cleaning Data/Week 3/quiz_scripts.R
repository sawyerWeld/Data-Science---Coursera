# Scripts for the week 3 quiz
#
# Uploading this because question 2 was confusing 
# and because there have been no programming assignments

##############################

# quiz question 1
# more than ten acres means ACR = 3
# 10k in agricultural sales means AGS = 6

load(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "quizdata.csv")
data <- read.csv("quizdata.csv")
agricultureLogial <- data$ACR == 3 & data$AGS == 6
head(which(agricultureLogial),3)
# [1] 125 238 262

##############################

# quiz question 2

load(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "quizimage.jpg", method = "curl")
data2 <- readJPEG("quizimage.jpg", native = TRUE)
quantile(data2, probs = c(0.3, 0.8))
#           30%         80% 
#   -15259150.1 -10575416.0 

##############################

# quiz question 3
# I think there was a better way to do merging with dplyr but I cant remember

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "gdpdata.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "educationdata.csv")
gdp <- read.csv("gdpdata.csv", skip = 4, nrows = 190, stringsAsFactors = FALSE)
edu <- read.csv("educationdata.csv", stringsAsFactors = FALSE)
gdp <- select(gdp, X, X.1, X.4)
colnames(gdp) <- c("CountryCode","Rank","GDP")
data3 <- merge(gdp, edu, by = "CountryCode")
data3 <- arrange(data3, desc(Rank))  
nrow(data3)
data3[13,4]
# [1] 189
# [1] "St. Kitts and Nevis"

##############################

# quiz question 4
# uses objects made in question 3

OECD <- subset(data3, Income.Group == "High income: OECD")
mean(OECD$Rank)
nonOECD <- subset(data3, Income.Group == "High income: nonOECD")
mean(nonOECD$Rank)
# [1] 32.96666667
# [1] 91.91304348

##############################

# quiz question 4
# uses objects made in question 3
# 5 groups because 38 * 5 = 190

data3$group <- cut(data3$Rank, breaks = 5) 
table(data3$group, data3$Income.Group)

# High income: nonOECD High income: OECD Low income Lower middle income Upper middle income
# (0.811,38.8]                    4                18          0           Answer: 5                  11
# (38.8,76.6]                     5                10          1                  13                   9
# (76.6,114]                      8                 1          9                  12                   8
# (114,152]                       4                 1         16                   8                   8
# (152,190]                       2                 0         11                  16                   9
