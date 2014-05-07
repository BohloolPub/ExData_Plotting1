power_consumption <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
consumption_data <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Create new Date_time field
consumption_data$Date_time <- as.POSIXct(strptime(paste(consumption_data$Date, consumption_data$Time, sep=":"), format="%d/%m/%Y:%H:%M:%S"))

png("plot2.png")
plot(consumption_data$Global_active_power ~ consumption_data$Date_time, type = "l", xlab="", ylab="Global Active Power (killowatts)")
dev.off()