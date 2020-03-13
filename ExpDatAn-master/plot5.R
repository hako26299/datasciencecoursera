nei <- readRDS("summarySCC_PM25.rds")
b <- nei$fips == "24510"
balt <- nei[b,]
motLog <- balt$type == "ON-ROAD"
motOnRoad <- balt[motLog,]
with(motOnRoad, plot(year, Emissions, xlab = "Years", ylab = expression(PM[2.5]*' Emissions from Motor Vehicle Sources'), main = "Baltimore City"))
dev.copy(png, file = "plot5.png")
dev.off()