##	Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##	Setting vectors which will be plotted
years <- c(1999,2002,2005,2008)
Emissions_baltimore_means <- c(mean(NEI$Emission[NEI$year == 1999 & NEI$fips == 24510]),
					 mean(NEI$Emission[NEI$year == 2002 & NEI$fips == 24510]),
					 mean(NEI$Emission[NEI$year == 2005 & NEI$fips == 24510]),
					 mean(NEI$Emission[NEI$year == 2008 & NEI$fips == 24510]))

##	Plotting	
plot(years, Emissions_baltimore_means, type = "l", main = "Poluttions in Baltimore between years 1999 and 2008",
	ylab = "Mean of emission [tons]", xlab = "Year" )

##	Saving into the file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()