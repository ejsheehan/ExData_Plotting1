#read text file
dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
#create a combined Date and Time column
dat$Date_Time<-paste(dat$Date, dat$Time)
#identify Date and Time as date class
dat$Date_Time<-strptime(dat$Date_Time, "%e/%m/%Y %H:%M:%S")
#identify Date column as date class for use of subsetting
dat$Date<-strptime(dat$Date, "%e/%m/%Y")
#subset data to only include 2/1/2007 and 2/2/2007
dat<-dat[dat$Date=="2007-02-01" | dat$Date=="2007-02-02",]
#use lubridate to name dates with abbreviated weekday name
library(lubridate)
dat$day<-wday(dat$Date)
#open connection to png graphic device
png(file="plot2.png")
#create line plot
plot(dat$Date_Time, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#end connection to graphic device
dev.off()