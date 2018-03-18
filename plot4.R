# Plot 4
## Read in data
elec = read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",sep=';',na.strings = "?",header=TRUE)
elec.dates = elec[which(elec$Date %in% c("1/2/2007","2/2/2007")),]
elec.dates$Date.Time = strptime(paste(elec.dates$Date,elec.dates$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

## Plot
png(filename="plot4.png")
par(mfrow=c(2,2))

# a
with(elec.dates,plot(Date.Time,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(elec.dates,lines(Date.Time,Global_active_power))

# b
with(elec.dates,plot(Date.Time,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(elec.dates,lines(Date.Time,Voltage))

# c
with(elec.dates,plot(Date.Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(elec.dates,lines(Date.Time,Sub_metering_1))
with(elec.dates,lines(Date.Time,Sub_metering_2,col="red"))
with(elec.dates,lines(Date.Time,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")

# d
with(elec.dates,plot(Date.Time,Global_reactive_power,type="n",xlab="datetime"))
with(elec.dates,lines(Date.Time,Global_reactive_power))

dev.off()