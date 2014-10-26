# Read Data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

# Preparing data

rowno <- grep("coal", x= code$Short.Name,ignore.case=TRUE)
scscid <- code$SCC[rowno]
data2 <- subset(data, data$SCC == scscid)

sumvec <- rowsum(data2$Emissions, data2$year)
new.df <- cbind.data.frame(rownames(sumvec), sumvec)
colnames(new.df) <- c("Year", "Emission")

# Plotting :D

png("plot4.png")
plot(new.df)
dev.off()




