#setwd("F:/Coursera/John Hopkins/Exploratory Data Analysis/project 2")
# Load NEI & SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI datarelated to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset vehicles NEI data for each city 
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimoreNEI$city <- "Baltimore City"

vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"

# Combine two subsets with city name and create one data frame
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

png("plot6.png",width=480,height=480,units="px")

library(ggplot2)
#Plot data 
ggp <- qplot(x=as.factor(year), y=Emissions, facets= .~ city, fill=city,
                       data=bothNEI, geom="bar", stat="identity",
                       position="dodge")+
                       labs(title="Motor Vehicle Emissions in Baltimore and LA\n")+
                       guides(fill=FALSE)+
                       labs(x="Year", y="PM2.5 Emission (Tons)")

print(ggp)
dev.off()
