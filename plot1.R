# plot1.R
# Assumes all data files are located in subdirectory data in working directory
# Assumes there exists a subdirectory output_data in working directory 

from_file <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
sub <- from_file[from_file$Date == "1/2/2007" | from_file$Date == "2/2/2007",]
rm(from_file)
sub$Date <- as.Date(sub$Date, "%d/%m/%Y") 
sub$Time <- strptime(sub$Time, "%H:%M:%S")

tbl <- table(cut(sub$Global_active_power, breaks = 0.5*(0:12)))
barplot(matrix(tbl), space = c(0,0), beside = TRUE, col = "red")
axis(1, 4*0:3, 2*0:3, line = 0.75)
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "./data_output/plot1.png")  
dev.off()  