//read the data
library(dplyr)
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

//filter Baltimore data & summarize Emissions by years
plot2 <- filter (data, fips == 24510)
s <- summarize ( group_by (plot2, year), Total_Emission = sum(Emissions))

//Plot & save png
with(s, plot(year, Total_Emission, type = "l", ylim = c(1000,3500), main = "Total PM2.5 Emission by years in Baltimore City"))
dev.copy(png, file = "plot2.png")
dev.off()