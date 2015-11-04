//read the data
library(dplyr)
library(ggplot2)

data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grep("[Cc]oal", SCC$Short.Name)
coalSCC <- SCC[coal, ]

merged <- merge(data, coalSCC, by = "SCC")
agg <- aggregate(Emissions ~ year, merged, sum)

g <- ggplot(agg, aes(factor(year), Emissions))
g + geom_bar(stat="identity") + labs(x = "Year") + labs (title = "Total Emissions from Coal Sources")

dev.copy(png, file = "plot4.png")
dev.off()