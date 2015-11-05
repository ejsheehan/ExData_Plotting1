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
png(file="plot3.png")
#create line plot
plot(dat$Date_Time, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
#add lines of additional data on same plot
lines(dat$Date_Time, dat$Sub_metering_2, col="red")
lines(dat$Date_Time, dat$Sub_metering_3, col="blue")
#add legend
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))
#end connection to graphic device
dev.off()