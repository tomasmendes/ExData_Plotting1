f <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

f <- transform(f, Date = as.Date(Date, format = "%d/%m/%Y"))
f <- transform(f, Time = strptime(Time, format = "%H:%M:%S"))
f$concat <- paste(f$Date, f$Time,sep=" ")

png(filename="plot4.png", width = 480, height = 480)
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")

fsub <- subset(f, Date >= min)
fsub <- subset(fsub, Date <= max)

par(mfrow=c(2,2))
plot(1:nrow(fsub), fsub$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(1:nrow(fsub), fsub$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(1:nrow(fsub), fsub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(1:nrow(fsub), fsub$Sub_metering_2,col="red")
lines(1:nrow(fsub), fsub$Sub_metering_3,col="blue")
legend("topright", pch="-", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(1:nrow(fsub), fsub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()