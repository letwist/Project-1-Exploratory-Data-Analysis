##create first plot
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red",)

##Convert to PNG
dev.copy(png,"plot1.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()