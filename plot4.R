y<-read.csv("household_power_consumption.txt",sep=";",stringAsFactorS=FALSE)
y[,1]<-as.Date(y[,1],"%d/%m/%Y")
t<-y[,1]>="2007-02-01"&y[,1]<="2007-02-02"
y<-y[t,]
datetime<-paste(y[,1],y[,2])
y[,2]<-as.POSIXct(datetime)
png("plot3.png",width=480,height=480)
par(mfrow=c(2,2))
with(y,plot(Global_active_power~Time,type="l",ylab="Global Active Power",xlab=""))
with(y,plot(Voltage~Time,type="l",ylab="Voltage",xlab="datetime"))
with(y,plot(Sub_metering_1~Time,col="black",type="l",ylab="Energy sub metering",xlab=""))
lines(y$Sub_metering_2~y$Time,col="red")
lines(y$Sub_metering_3~y$Time,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1,bty="n")
with(y,plot(Global_reactive_power~Time,type="l",xlab="datetime"))
dev.off()
