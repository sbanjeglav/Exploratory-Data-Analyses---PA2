//read the data
library(dplyr)
library(ggplot2)

data <- readRDS("summarySCC_PM25.rds")

data2 <- filter(data, fips=="24510" & type=="ON-ROAD")
agg <- aggregate(Emissions ~ year, data2, sum)

g <- ggplot(agg, aes(factor(year), Emissions))
g + geom_bar(stat="identity") + labs(x = "Year") + labs (title = "Total Emissions from Motor Vehicle Sources")

dev.copy(png, file = "plot5.png")
dev.off()