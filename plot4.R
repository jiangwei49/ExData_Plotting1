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
data2$Voltage <- as.numeric(data2$Voltage)
data2$Global_reactive_power<-as.numeric(data2$Global_reactive_power)

## remove unused objects
rm(data)
rm(data1)

## plot
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
## plot 1
with(data2,plot(data2$Time2, data2$Global_active_power,type="l",xlab="",ylab="Global Active Power"))
## plot 2
with(data2,plot(data2$Time2, data2$Voltage,type="l",xlab="datetime",ylab="Voltage"))
## plot 3
with(data2,plot(data2$Time2, data2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(data2,points(data2$Time2,data2$Sub_metering_1,type="l"))
with(data2,points(data2$Time2,data2$Sub_metering_2,col="red",type="l"))
with(data2,points(data2$Time2,data2$Sub_metering_3,col="blue",type="l"))
with(data2,legend("topright",pch=95,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
## plot 4
with(data2,plot(data2$Time2, data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
## turn off device
dev.off()