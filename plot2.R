f <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

f <- transform(f, Date = as.Date(Date, format = "%d/%m/%Y"))
f <- transform(f, Time = strptime(Time, format = "%H:%M:%S"))
f$concat <- paste(f$Date, f$Time,sep=" ")

png(filename="plot2.png", width = 480, height = 480)
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")

fsub <- subset(f, Date >= min)
fsub <- subset(fsub, Date <= max)
plot(1:nrow(fsub), fsub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1,at=c(1,nrow(fsub)/2,nrow(fsub)), labels=c("Thu","Fri","Sat"))

dev.off()