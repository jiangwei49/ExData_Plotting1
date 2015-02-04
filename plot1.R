## load data
## setwd("d:/R/RStudio/coursera/4.Exploratory_data_analysis/")
data <- read.csv("./household_power_consumption.txt", sep=";",header=TRUE)
data1 <- data

## clean data
data1$Date <- strptime(data1$Date, format="%d/%m/%Y")
data1$Date <- as.Date(data1$Date)
data2<-data1[which(data1$Date>"2007-01-31"),]
data2<-data2[which(data2$Date<"2007-02-03"),]
table(data2$Date)
## 2007-02-01 2007-02-02
##       1440       1440

## remove unused objects
rm(data)
rm(data1)
data3<-data2
data3$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

## plot
png(filename="plot1.png",width=480,height=480)
with(data3, hist(data3$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
