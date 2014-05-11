#f <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
#f <- transform(f, Date = as.Date(Date, format = "%d/%m/%Y"))
#f <- transform(f, Time = strptime(Time, format = "%H:%M:%S"))

png(filename="plot1.png", width = 480, height = 480)
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")
fsub <- subset(f, Date >= min)
fsub <- subset(fsub, Date <= max)
hist(fsub$Global_active_power, main="Global Active Power",
      xlab="Global Active Power (kilowatts)", col="red", xlim=range(0:6))
