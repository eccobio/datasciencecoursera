# plot2.R
# Assumes all data files are located in subdirectory data in working directory
# Assumes there exists a subdirectory output_data in working directory 

from_file <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
sub <- from_file[from_file$Date == "1/2/2007" | from_file$Date == "2/2/2007",]
rm(from_file)
sub$Date <- as.Date(sub$Date, "%d/%m/%Y") 
sub$Time <- strptime(sub$Time, "%H:%M:%S")

plot(sub$Global_active_power, type = "l", xaxt='n', ann=FALSE)
axis(1, c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
title(ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "./data_output/plot2.png")  
dev.off()