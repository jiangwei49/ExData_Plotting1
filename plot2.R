## load data
## setwd("d:/R/RStudio/coursera/4.Exploratory_data_analysis/")
data <- read.csv("./household_power_consumption.txt", sep=";",header=TRUE, as.is = TRUE)
data$Time2 <- paste(data$Date, data$Time)
data1 <- data

## clean data
data1$Date <- strptime(data1$Date, format="%d/%m/%Y")
data1$Date <- as.Date(data1$Date)
data2<-data1[which(data1$Date>"2007-01-31"),]
data2<-data2[which(data2$Date<"2007-02-03"),]

library(lubridate)
data2$Time2 <- dmy_hms(data2$Time2)

## remove unused objects
rm(data)
rm(data1)

## plot
png(filename="plot1.png",width=480,height=480)
with(data2, plot(data2$Time2, data2$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
dev.off()
