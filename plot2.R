y<-read.csv("household_power_consumption.txt",sep=";",stringAsFactorS=FALSE)
y[,1]<-as.Date(y[,1],"%d/%m/%Y")
t<-y[,1]>="2007-02-01"&y[,1]<="2007-02-02"
y<-y[t,]
datetime<-paste(y[,1],y[,2])
y[,2]<-as.POSIXct(datetime)
png("plot2.png",width=480,height=480)
with(y,plot(y$Global_active_power~y$Time,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.on()
