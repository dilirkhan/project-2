#Read data
library(ggplot2)
nei <- readRDS("summarySCC_PM25.rds")

#Subset for Baltimore City
balt <- nei[nei$fips == "24510",]


#Open png device
png(filename="plot3.png")

#Plot
           
ggp <- qplot(x=as.factor(year), y=Emissions, facets= .~ type, fill=type,
             data=balt, geom="bar", stat="identity",
             position="dodge")+
             labs(title="Emissions from Different Sources in Baltimore\n")+
             guides(fill=FALSE)+
             labs(x="Year", y="PM2.5 Emission (Tons)")  
print(ggp)

#Close Device
dev.off()


