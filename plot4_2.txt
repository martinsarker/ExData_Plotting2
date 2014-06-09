##	Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##	Creating vector with SCC numbers of combustion-related sources
SCC_combustion_related <- SCC_combustion_related <- SCC$SCC[grep("[Cc]oal", SCC$EI.Sector)]

##	Subsets only combustion-related data
NEI_combustion_related <- NEI[NEI$SCC %in% SCC_combustion_related ,]

##	Setting vectors which will be plotted
years <- c(1999,2002,2005,2008)
Combustion_emissions_means <- c(mean(NEI_combustion_related$Emission[NEI_combustion_related$year == 1999]),
			   mean(NEI_combustion_related$Emission[NEI_combustion_related$year == 2002]),
			   mean(NEI_combustion_related$Emission[NEI_combustion_related$year == 2005]), 
			   mean(NEI_combustion_related$Emission[NEI_combustion_related$year == 2008]))

##	Plotting
plot(years, Combustion_emissions_means, type = "l", main = "Combustion-related emissions between years 1999 and 2008",
	ylab = "Mean of emission [tons]", xlab = "Year" )


##	Saving into the file
dev.copy(png, file = "plot4_2.png", width = 480, height = 480)
dev.off()