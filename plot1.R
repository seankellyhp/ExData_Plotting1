# Plot 1

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

# Plot 1

png("plot1.png", width=480, height=480)
with(df.b, hist(Global_active_power, col="red", main="global active power", xlab="Global Active Power (kilowats)"))
dev.off()