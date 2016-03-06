project1 <- "./Desktop/household_power_consumption.txt"
pro1 <- read.table(project1, na.strings = "?", stringsAsFactors = FALSE, dec = ".", header = TRUE, sep = ";")
subsetpro1 <- pro1[pro1$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetpro1$Date, subsetpro1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subsetpro1$Global_active_power)
metering <- as.numeric(subsetpro1$Sub_metering_1)
metering2 <- as.numeric(subsetpro1$Sub_metering_2)
metering3 <- as.numeric(subsetpro1$Sub_metering_3)
png("plot3.png", width = 480,height = 480)
plot(datetime, metering, type = "l",ylab = "Energy Submetering")
lines(datetime, metering2, type = "l",col="red")
lines(datetime, metering3, type = "l",col="blue")
legend("topright", c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_2" ),col = c("black", "red", "blue"), lwd = 2.5,lty = 1)
dev.off()