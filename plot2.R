# Plot 2
## Read in data
elec = read.table("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",sep=';',na.strings = "?",header=TRUE)
elec.dates = elec[which(elec$Date %in% c("1/2/2007","2/2/2007")),]
elec.dates$Date.Time = strptime(paste(elec.dates$Date,elec.dates$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

## Plot
png(filename="plot2.png")
with(elec.dates,plot(Date.Time,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(elec.dates,lines(Date.Time,Global_active_power))
dev.off()