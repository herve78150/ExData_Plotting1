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
png("plot2.png", width = 480, height = 480)
plot(date_heure, subsettd$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
