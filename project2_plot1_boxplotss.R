setwd("C:/Users/Sharky/coursera/Data science/Exploratory data analysis/Project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


par(mfrow=c(4,4))
plot_year <- function(year){
	pollution_point <- NEI$Emissions[NEI$type == "POINT" & NEI$year == year]
	pollution_nonpoint <- NEI$Emissions[NEI$type == "NONPOINT" & NEI$year == year]
	pollution_onroad <- NEI$Emissions[NEI$type == "ON-ROAD" & NEI$year == year]
	pollution_nononroad <- NEI$Emissions[NEI$type == "NON-ROAD" & NEI$year == year]
	
	boxplot(pollution_point, main=year, ylab = "Emission", xlab = "Point" )
	boxplot(pollution_nonpoint, main=year, ylab = "Emission", xlab = "Non-point")
	boxplot(pollution_onroad, main=year, ylab = "Emission", xlab = "On-road")
	boxplot(pollution_nononroad, main=year, ylab = "Emission", xlab = "Non-on-road")
}
plot_year(1999)
plot_year(2002)
plot_year(2005)
plot_year(2008)