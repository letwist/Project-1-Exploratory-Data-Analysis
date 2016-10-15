##Loading the dataset and cleaning it
power <- read.table("~/Desktop/power.txt", header=TRUE, sep=";", na.strings = "?", 
colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Convert data
power$Date <- as.Date(power$Date, "%d/%m/%Y")

##Subsetting data
power <- subset(power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##extract only the complete cases
power <- power[complete.cases(power),]

##Squish Date and Time together
dateTime <- paste(power$Date, power$Time)

##I dub thee. . .
dateTime <- setNames(dateTime, "DateTime")

##Remove these columns
power <- power[ ,!(names(power) %in% c("Date","Time"))]

##Make sure dateTime is joined to the rest of the data
power <- cbind(dateTime, power)

##final formatting
power$dateTime <- as.POSIXct(dateTime)

##create first plot
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red",)

##Convert to PNG
dev.copy(png,"plot1.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()

##create plot 2
plot(power$Global_active_power~power$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##convert to PNG
dev.copy(png,"plot2.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()

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

##Create plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(power, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })
  
##convert to PNG
dev.copy(png,"plot3.png", width=480, height=480)

##TURN OFF DEVICE
dev.off()