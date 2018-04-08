# plot4.R
# Assumes all data files are located in subdirectory data in working directory
# Assumes there exists a subdirectory output_data in working directory 

from_file <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
sub <- from_file[from_file$Date == "1/2/2007" | from_file$Date == "2/2/2007",]
rm(from_file)
sub$Date <- as.Date(sub$Date, "%d/%m/%Y") 
sub$Time <- strptime(sub$Time, "%H:%M:%S")

par(mfrow=c(2,2))

# Graph 1

plot(sub$Global_active_power, type = "l", xaxt='n', ann=FALSE)
axis(1, c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
title(ylab = "Global Active Power (kilowatts)")

# Graph 2

ytics <- 230+c(4, 6, 8, 10, 12, 14, 16)
ylabs <- vector()
for( i in 1:length(ytics) ){ if( i %% 2 != 0 ) ylabs[i] <- ytics[i] else ylabs[i] <- ""}
plot(sub$Voltage, type = "l", xaxt='n', yaxt='n', ann=FALSE)
axis(2, ytics, ylabs)
axis(1, c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
title(ylab = "Voltage", xlab="datetime")

# Graph 3

plot(sub$Sub_metering_1, type = "l", xaxt='n', ann=FALSE)
axis(1, c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
title(ylab = "Energy sub metering")
points(sub$Sub_metering_2, type = "l", col = "red")
points(sub$Sub_metering_3, type = "l", col = "blue")
legend("topright",  lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Graph 4

plot(sub$Global_reactive_power, type = "l", xaxt='n', ann=FALSE)
axis(1, c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
title(ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "./data_output/plot4.png")  
dev.off()
