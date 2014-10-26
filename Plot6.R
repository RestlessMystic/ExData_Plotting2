# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
data2 <- subset(data, data$fips == 24510 & data$type == "ON-ROAD")

data3 <- subset(data, data$fips == 06037 & data$type == "ON-ROAD")
# Preparing data
sumvec <- rowsum(data2$Emissions, data2$year)
sumvec2 <- rowsum(data3$Emissions, data3$year)


new.df <- cbind.data.frame(rownames(sumvec), sumvec, sumvec2)
colnames(new.df) <- c("Year", "Baltimore", "Los Angeles")
# Plotting :D

png("plot5.png")
plot(new.df)
dev.off()




