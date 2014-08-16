#Read data
nei <- readRDS("summarySCC_PM25.rds")

#Subset for Baltimore City
balt <- nei[nei$fips == "24510",]

#Summarize Data
aggdata <-aggregate(balt$Emissions, by=list(balt$year), FUN=sum, na.rm=TRUE)

#Open png device
png(filename="plot2.png")

#Plot
plot(aggdata, type ="b", main="Emissions in Baltimore City", xlab="Year", ylab="Total emissions from PM2.5 (Tons)")

#Close Device
dev.off()
