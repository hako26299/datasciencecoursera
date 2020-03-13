nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
ei <- as.character(scc$EI.Sector)
eiSep <- strsplit(ei, " - ", fixed = T)
val <- vector("logical", 0L)
for (i in eiSep)
{
if((i[1] == "Fuel Comb")&&(i[3] == "Coal"))
val <- append(val, TRUE)
else
val <- append(val, FALSE)
}
valTyp <- scc[val,]
valCds <- valTyp$SCC
coalComb <- nei$SCC == valCds
coal <- nei[coalComb,]
with(coal, plot(year, Emissions, pch = 20, xlab = "Years", ylab = expression(PM[2.5]*' Emissions from Coal Combustion Sources')))
dev.copy(png, file = "plot4.png")
dev.off()
