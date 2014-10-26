# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")


# Cleaning data

sumvec <- rowsum(data$Emissions, data$year)
new.df <- cbind.data.frame(rownames(sumvec), sumvec)
colnames(new.df) <- c("Year", "Emission")

# Plotting :D

png("plot1.png")
plot(new.df)
dev.off()




