library(lubridate)
library(data.table)
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_data_household_power_consumption.zip",method="internal")
f<-unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
d<-read.csv(f,header=T,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
d<-data.table(d)
d<-d[Date=='1/2/2007' | Date=='2/2/2007']
d<-transform(d,DateTime=paste(Date,Time))
d<-transform(d,DateTime=dmy_hms(DateTime))

#2
png("plot2.png")
with(d,plot(DateTime,Global_active_power,main="",ylab="",xlab="",type="l"))
title(ylab="Global Active Power (kilowatts)")
dev.off()