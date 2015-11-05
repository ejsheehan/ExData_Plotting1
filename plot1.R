#read text file
dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
#identify Date column as date class
dat$Date<-strptime(dat$Date, "%e/%m/%Y")
#subset data to only include 2/1/2007 and 2/2/2007
dat<-dat[dat$Date=="2007-02-01" | dat$Date=="2007-02-02",]
#open connection to png graphic device
png(file="plot1.png")
#create histogram plot
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#end connection to graphic device
dev.off()