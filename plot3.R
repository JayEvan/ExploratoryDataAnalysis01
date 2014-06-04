## plot3.R
## full dataset was processed to a select desired data using extractor.R
powersub <- read.table(file = "powersub.csv", sep = ",")
powersub$DateTime <- strptime(powersub$DateTime, format = "%Y-%m-%d %H:%M:%S")

## set up the graphics device
quartz(width = 4.8, height = 4.8, dpi = 100, bg = "white", pointsize = 10)

## these commands are equivalent
### plot(x = powersub$DateTime, y = powersub$Sub_metering_1, type = "l")
### with(powersub, plot(DateTime, Sub_metering_1, type = "l"))
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

quartz.save(file = "plot3.png", type = "png")
