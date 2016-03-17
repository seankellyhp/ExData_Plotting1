## Plot 3

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

## Plot3
png("plot3.png", width=480, height=480)
with(df.b, {
        plot(Sub_metering_1 ~ Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ Datetime,col='Red')
        lines(Sub_metering_3 ~ Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()