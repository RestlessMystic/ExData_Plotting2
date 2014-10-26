library("ggplot2")

# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")
data1 <- subset(data, data$fips == 24510 & data$type == "POINT")
data2 <- subset(data, data$fips == 24510 & data$type == "NONPOINT")
data3 <- subset(data, data$fips == 24510 & data$type == "ON-ROAD")
data4 <- subset(data, data$fips == 24510 & data$type == "NON-ROAD")
# Preparing data

sumvec1 <- rowsum(data1$Emissions, data1$year)
sumvec2 <- rowsum(data2$Emissions, data2$year)
sumvec3 <- rowsum(data3$Emissions, data3$year)
sumvec4 <- rowsum(data4$Emissions, data4$year)

new.df <- cbind.data.frame(rownames(sumvec1), sumvec1, sumvec2, sumvec3, sumvec4)
colnames(new.df) <- c("Year", "POINT", "NONPOINT", "ONROAD", "NONROAD")
# Plotting :D

png("plot3.png")
g = ggplot(new.df, aes(Year, y = Emission, color = Type)) + 
  geom_point(aes(y = POINT, col = "POINT"), size = 3) + 
  geom_point(aes(y = NONPOINT, col = "NONPOINT"), size = 3) +
  geom_point(aes(y = ONROAD, col = "ONROAD"), size = 3) + 
  geom_point(aes(y = NONROAD, col = "NONROAD"), size = 3)
print(g)
dev.off()




