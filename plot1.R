y<-read.csv("household_power_consumption.txt",sep=";",stringAsFactorS=FALSE)
y[,1]<-as.Date(y[,1],"%d/%m/%Y")
t<-y[,1]>="2007-02-01"&y[,1]<="2007-02-02"
y<-y[t,]
png("plot1.png",width=480,height=480)
hist(y$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()