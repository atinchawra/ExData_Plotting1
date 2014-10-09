library(lubridate)
library(data.table)
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_data_household_power_consumption.zip",method="internal")
f<-unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
d<-read.csv(f,header=T,sep=";",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))
d<-data.table(d)
d<-d[Date=='1/2/2007' | Date=='2/2/2007']
d<-transform(d,DateTime=paste(Date,Time))
d<-transform(d,DateTime=dmy_hms(DateTime))

#4
par(mar=c(1,1,1,1))
par(mfrow=c(2,2))
with(d,plot(DateTime,Global_active_power,type="l"))
with(d,plot(DateTime,Voltage,type="l"))
with(d,plot(DateTime,Sub_metering_1,col="black",type="l"))
with(d,lines(DateTime,Sub_metering_2,col="red",type="l"))
with(d,lines(DateTime,Sub_metering_3,col="blue",type="l"))
with(d,plot(DateTime,Global_reactive_power,type="l"))
