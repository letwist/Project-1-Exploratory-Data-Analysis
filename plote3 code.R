##create plot 3
with(power, {
     plot(Sub_metering_1~dateTime, type="l",
          ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~dateTime,col='Red')
     lines(Sub_metering_3~dateTime,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
          c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
          
##convert to PNG
dev.copy(png,"plot3.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()
