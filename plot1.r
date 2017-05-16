file <- "./data/household_power_consumption.txt"

# import file into dataframe
classes <-c("character", "character","numeric", "numeric", "numeric",
            "numeric","numeric", "numeric", "numeric")
td <- read.table(file, sep=";", header=TRUE, colClasses = classes, dec=".",na.strings = "?")

#subset Date between "1/2/2007" and  "2/2/2007"
subsettd <- td [ td$Date == "1/2/2007" | td$Date == "2/2/2007", ]

#hist on jpeg device
png("plot1.png", width = 480, height = 480)
hist(subsettd$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.off()