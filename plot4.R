## Plot 4

## Set WD
setwd("C:/Users/seanpalicki/Desktop/Cleaning_Data_Assignment")

## Get Data
df <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings = "?")

## Clean Data
df.a <- df
df.a$Date <- as.character(df.a$Date)
df.a$Date <- as.Date(df.a$Date, "%d/%m/%Y")

library(dplyr)

df.b <- df.a %>% 
        filter(Date == as.Date("2007/02/01", "%Y/%m/%d") | Date == as.Date("2007/02/02", "%Y/%m/%d"))

## Dates

datetime <- paste(as.Date(df.b$Date), df.b$Time)
df.b$Datetime <- as.POSIXct(datetime)

## Plot 4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df.b, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()