# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
data2 <- subset(data, data$fips == 24510)
# Preparing data
sumvec <- rowsum(data2$Emissions, data2$year)
new.df <- cbind.data.frame(rownames(sumvec), sumvec)
colnames(new.df) <- c("Year", "Emission")

# Plotting :D

png("plot2.png")
plot(new.df)
dev.off()




