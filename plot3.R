# Plot 3 
## Read in data
elec = read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",sep=';',na.strings = "?",header=TRUE)
elec.dates = elec[which(elec$Date %in% c("1/2/2007","2/2/2007")),]
elec.dates$Date.Time = strptime(paste(elec.dates$Date,elec.dates$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

## Plot
png(filename="plot3.png")
with(elec.dates,plot(Date.Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(elec.dates,lines(Date.Time,Sub_metering_1))
with(elec.dates,lines(Date.Time,Sub_metering_2,col="red"))
with(elec.dates,lines(Date.Time,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")
dev.off()