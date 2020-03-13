nei <- readRDS("summarySCC_PM25.rds")
b <- nei$fips == "24510"
l <- nei$fips == "06037"
balt <- nei[b,]
la <- nei[l,]
motLogB <- balt$type == "ON-ROAD"
motLogL <- la$type == "ON-ROAD"
motOnRoadB <- balt[motLogB,]
motOnRoadL <- la[motLogL,]
par(mfrow = c(1, 2), mar = c(4, 4, 2, 2))
with(motOnRoadB, plot(year, Emissions, xlab = "Years", ylab = expression(PM[2.5]*' Emissions from Motor Vehicle Sources'), main = "Baltimore City"))
with(motOnRoadL, plot(year, Emissions, xlab = "Years", ylab = expression(PM[2.5]*' Emissions from Motor Vehicle Sources'), main = "Los Angeles County"))
dev.copy(png, file = "plot6.png")
dev.off()