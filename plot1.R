## plot1.R
# Exploratory Data Analysis
## Course Project 1
## Data are from UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/), 
## a popular repository for machine learning datasets.
## download and unzip data file
setwd("~/Desktop/EDA01")

## read the first few lines of this large dataset to obtain descriptive parameters
## NA are indicated by "?"
littleread <- read.table(file = "household_power_consumption.txt", 
                         header = TRUE, 
                         sep = ";", 
                         nrows = 5,
                         na.strings = "?")

## get the columns names
cnames <- names(littleread)

## get and set colClasses for all columns then pass to read.table to speed the read
## The desired data are from dates 2007-02-01 and 2007-02-02,
## could do selective read but time required for read is not bad and why not look at the data
classes <- sapply(littleread, class)
dt1 <- read.table(file = "household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";",
                  na.strings = "?",
                  #nrows = 50, 
                  col.names = cnames,
                  colClasses = classes)

## The desired data are from dates 2007-02-01 and 2007-02-02,
## could do selective read but time required for read is not bad and why not look at the data
## set Date column as.Date and use to subset.  
dt1$Date <- as.Date(dt1$Date, "%d/%m/%Y")
##
dt2 <- subset(dt1, (dt1$Date >= "2007-02-01" & dt1$Date <= "2007-02-02"))

## join Date and Time columns
DateTime <- paste(dt2$Date, dt2$Time)
## add to table
dt3 <- cbind(DateTime, dt2)
write.table(dt3, file = "powersub.csv", sep = ",")

## full dataset was processed to a select desired data
powersub <- read.table(file = "powersub.csv", sep = ",")
powersub$DateTime <- strptime(powersub$DateTime, format = "%Y-%m-%d %H:%M:%S")

quartz(width = 4.8, height = 4.8, dpi = 100, bg = "white", pointsize = 10) 
p1 <- hist(powersub$Global_active_power, 
     freq = TRUE, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     cex.lab = 1,
     cex.main = 1,
     cex.axis = 1,
     ylim = c(0,1200)
     )
quartz.save(file = "plot1.png", type = "png")

