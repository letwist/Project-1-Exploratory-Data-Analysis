##create plot 2
plot(power$Global_active_power~power$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##convert to PNG
dev.copy(png,"plot2.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()
