project1 <- "./Desktop/household_power_consumption.txt"
pro1 <- read.table(project1, na.strings = "?", stringsAsFactors = FALSE, dec = ".", header = TRUE, sep = ";")
subsetpro1 <- pro1[pro1$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetpro1$Date, subsetpro1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subsetpro1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,gap, type = "l", ylab = "global Activity power (kilowatts)")
dev.off()