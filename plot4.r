#Conversion DateTime
d<- as.Date(subsettd$Date, "%d/%m/%Y")
date_heure <- strptime(paste(d, subsettd$Time),"%Y-%m-%d %H:%M:%S")

# Plot on jpeg device

png("plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))

# 1er Graph
plot(date_heure, subsettd$Global_active_power,xlab = "", ylab="Global_active_power", type="l")

# 2eme Graph
plot(date_heure, subsettd$Voltage, xlab="datetime", ylab="Voltage", type="l")


# 3eme Graph
plot(date_heure, subsettd$Sub_metering_1, xlab="", ylab="Energy Sub_metering", type="l")
lines(date_heure, subsettd$Sub_metering_2, col = "red")
lines(date_heure, subsettd$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col=c("black", "red", "blue"), lty= 1, bty="n")

# 4 eme Graph
plot(date_heure, subsettd$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()