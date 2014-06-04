## plot2.R
## full dataset was processed to a select desired data using extractor.R
powersub <- read.table(file = "powersub.csv", sep = ",")
powersub$DateTime <- strptime(powersub$DateTime, format = "%Y-%m-%d %H:%M:%S")

quartz(width = 4.8, height = 4.8, dpi = 100, bg = "white", pointsize = 10)
plot(x = powersub$DateTime, y = powersub$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

quartz.save(file = "plot2.png", type = "png")
