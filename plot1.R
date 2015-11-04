//read the data
library(dplyr)
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

//summarize Emissions by years
s <- summarize ( group_by (data, year), Total_Emission = sum(Emissions))

//Plot & save png
with(s, plot(year, Total_Emission, type = "l", ylim = c(1000000, 8000000), main = "Total PM2.5 Emission by years"))
dev.copy(png, file = "plot1.png")
dev.off()