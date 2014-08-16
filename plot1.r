nei <- readRDS("summarySCC_PM25.rds")
#Summarize Data
aggdata <-aggregate(nei$Emissions, by=list(nei$year), FUN=sum, na.rm=TRUE)
#Open png device
png(filename="plot1.png")
#Plot
plot(aggdata, type ="b", main="Emissions in USA", xlab="Year", ylab="Total emissions from PM2.5 (Tons)")
#Close Device
dev.off()



