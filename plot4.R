power_consumption <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
consumption_data <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Create new Date_time field
consumption_data$Date_time <- as.POSIXct(strptime(paste(consumption_data$Date, consumption_data$Time, sep=":"), format="%d/%m/%Y:%H:%M:%S"))

png("plot4.png")
par(mfcol=c(2,2))
plot(consumption_data$Global_active_power ~ consumption_data$Date_time, type = "l", xlab="", ylab="Global Active Power (killowatts)")

plot(consumption_data$Sub_metering_1 ~ consumption_data$Date_time, type = "l", xlab="", ylab="Energy sub metering")
lines(consumption_data$Sub_metering_2 ~ consumption_data$Date_time, col="red")
lines(consumption_data$Sub_metering_3 ~ consumption_data$Date_time, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, bty="n")

plot(consumption_data$Voltage ~ consumption_data$Date_time, type = "l", xlab="datetime", ylab="Voltage")

plot(consumption_data$Global_reactive_power ~ consumption_data$Date_time, type = "l", xlab="datetime", ylab="Global Reactive Power")
dev.off()