file <- "./data/household_power_consumption.txt"
# import file into dataframe
classes <-c("character", "character","numeric", "numeric", "numeric",
            "numeric","numeric", "numeric", "numeric")
td <- read.table(file, sep=";", header=TRUE, colClasses = classes, dec=".",na.strings = "?")

#subset Date between "1/2/2007" and  "2/2/2007"
subsettd <- td [ td$Date == "1/2/2007" | td$Date == "2/2/2007", ]

#Conversion DateTime
d<- as.Date(subsettd$Date, "%d/%m/%Y")
date_heure <- strptime(paste(d, subsettd$Time),"%Y-%m-%d %H:%M:%S")

# Plot on jpeg device
png("plot3.png", width = 480, height = 480)
plot(date_heure, subsettd$Sub_metering_1, xlab="", ylab="Energy Sub_metering", type="l")
lines(date_heure, subsettd$Sub_metering_2, col = "red")
lines(date_heure, subsettd$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col=c("black", "red", "blue"), lty= 1)
dev.off()