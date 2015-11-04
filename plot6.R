//read the data
library(dplyr)
library(ggplot2)

data <- readRDS("summarySCC_PM25.rds")

data3 <- filter(data, fips=="06037" & type=="ON-ROAD")
agg3 <- aggregate(Emissions ~ year, data3, sum)

agg <- mutate(agg, Type = "Baltimore")
agg3 <- mutate(agg3, Type = "Loa Angeles")
dataALL <- rbind(agg,agg3)



g <- ggplot(dataALL, aes(year, Emissions))
g + geom_line(aes(color = Type)) + labs(x = "Year") + labs (title = "Total Emissions from Motor Vehicle Sources - LA vs. Baltimore")

dev.copy(png, file = "plot6.png")
dev.off()