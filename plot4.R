## plot4.R
## full dataset was processed to a select desired data using extractor.R
powersub <- read.table(file = "powersub.csv", sep = ",")
powersub$DateTime <- strptime(powersub$DateTime, format = "%Y-%m-%d %H:%M:%S")

## set up the graphics device
quartz(width = 4.8, height = 4.8, dpi = 100, bg = "white", pointsize = 7)
par(mfrow = c(2,2))

plot(x = powersub$DateTime, y = powersub$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(x = powersub$DateTime, y = powersub$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

with(powersub, plot(DateTime, Sub_metering_1, type = "l",
                    xlab = "",
                    ylab = "Energy sub metering",
                    col = "black",
                    bg = "white",
                    ylim = c(0,38)))
with(powersub, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(powersub, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))

plot(x = powersub$DateTime, y = powersub$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power (kilowatts)",
     xlab = "datetime")

quartz.save(file = "plot4.png", type = "png")