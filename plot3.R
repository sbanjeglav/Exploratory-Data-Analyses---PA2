library(dplyr)
data <- readRDS("summarySCC_PM25.rds")

plot3 <- filter (data, fips == 24510)

s <- summarize ( group_by (plot3, year,type ), Total_Emission = sum(Emissions))

g <- ggplot(s, aes(year, Total_Emission))
g +geom_line(aes(color=type)) + labs(title = "Emission 1999-2008 by types (Baltimore City)") 

dev.copy(png, file = "plot3.png")
dev.off()