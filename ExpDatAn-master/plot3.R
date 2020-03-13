library(ggplot2)
nei <- readRDS("summarySCC_PM25.rds")
b <- nei$fips == "24510"
balt <- nei[b,]
g <- ggplot(balt, aes(year, Emissions))
g + geom_point(color = "steelblue", size = 4, alpha = 1/2) + facet_grid(.~type) + labs(x = "Years", y = expression(PM[2.5]*" Emissions in Baltimore"))
dev.copy(png, file = "plot3.png")
dev.off()