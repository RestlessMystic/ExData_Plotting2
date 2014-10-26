library("ggplot2")

# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
data2 <- subset(data, data$fips == 24510 & data$type == "ON-ROAD")
data3 <- subset(data, data$fips == "06037" & data$type == "ON-ROAD")
# Preparing data
sumvec <- rowsum(data2$Emissions, data2$year)
sumvec2 <- rowsum(data3$Emissions, data3$year)
new.df <- cbind.data.frame(rownames(sumvec), sumvec, sumvec2)
colnames(new.df) <- c("Year", "Baltimore", "LosAngeles")
# Plotting :D

png("plot6.png")
g = ggplot(new.df, aes(Year, y = Emission, color = City)) + 
    geom_point(aes(y = Baltimore, col = "Baltimore")) + 
    geom_point(aes(y = LosAngeles, col = "Los Angeles"))
print(g)
dev.off()




