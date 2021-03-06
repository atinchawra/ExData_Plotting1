library(lubridate)
library(data.table)
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_data_household_power_consumption.zip",method="internal")
f<-unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
d<-read.csv(f,header=T,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
d<-data.table(d)
d<-d[Date=='1/2/2007' | Date=='2/2/2007']
d<-transform(d,DateTime=paste(Date,Time))
d<-transform(d,DateTime=dmy_hms(DateTime))

#3
png("plot3.png")
par(cex=0.6)
with(d,plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",col="black",type="l"))
with(d,lines(DateTime,Sub_metering_2,col="red",type="l"))
with(d,lines(DateTime,Sub_metering_3,col="blue",type="l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))
dev.off()
