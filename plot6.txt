##	Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##	Subset only Baltimore and Los Angeles data
NEI_Baltimore <- NEI[NEI$fips == "24510",]
NEI_LA <- NEI[NEI$fips == "06037",]

##	Creating vector with SCC numbers of motor-related sources
SCC_motor_related <- SCC$SCC[grep("[Mm]obile", SCC$EI.Sector)]
##	Subsets only motor-related data
NEI_motor_related_Baltimore <- NEI_Baltimore[NEI_Baltimore$SCC %in% SCC_motor_related ,]
NEI_motor_related_LA <- NEI_LA[NEI_LA$SCC %in% SCC_motor_related ,]

##	Setting vectors which will be plotted
years <- c(1999,2002,2005,2008)
Motor_emissions_means_Baltimore <- c(mean(NEI_motor_related_Baltimore$Emission[NEI_motor_related_Baltimore$year == 1999]),
			   mean(NEI_motor_related_Baltimore$Emission[NEI_motor_related_Baltimore$year == 2002]),
			   mean(NEI_motor_related_Baltimore$Emission[NEI_motor_related_Baltimore$year == 2005]), 
			   mean(NEI_motor_related_Baltimore$Emission[NEI_motor_related_Baltimore$year == 2008]))
Motor_emissions_means_LA <- c(mean(NEI_motor_related_LA$Emission[NEI_motor_related_LA$year == 1999]),
			   mean(NEI_motor_related_LA$Emission[NEI_motor_related_LA$year == 2002]),
			   mean(NEI_motor_related_LA$Emission[NEI_motor_related_LA$year == 2005]), 
			   mean(NEI_motor_related_LA$Emission[NEI_motor_related_LA$year == 2008]))

##	Plotting
par(mfrow=c(1,2))
plot(years, Motor_emissions_means_Baltimore, type = "l", main = "Motor-related emissions in Baltimore between years 1999 and 2008",
	ylab = "Mean of emission [tons]", xlab = "Year" )
plot(years, Motor_emissions_means_LA, type = "l", main = "Motor-related emissions in LA between years 1999 and 2008",
	ylab = "Mean of emission [tons]", xlab = "Year" )


##	Saving into the file
dev.copy(png, file = "plot6.png", width = 960, height = 480)
dev.off()