## plot3.R
## Coursera: Exploratory Data Analysis
## Project 1 Part 3
## This program loads the data and plots the time series data of the three  
## sub_metering. The plot is saved as plot3.png
## 

# ## change the working directory to the file containing the data file
# setwd('./Project 1')

## Load data
file <- "household_power_consumption.txt"

# read the data
colnames = c("Date","Time",
             "Global_active_power","Global_reactive_power",
             "Voltage","Global_intensity",
             "Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table(file, skip=66637, nrows=2880, header=F, col.names=colnames,
                   sep=";", stringsAsFactors=F, dec=".")


## Converting the dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(data$Date,data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the time series sub_meterings
windows() # using x11() for unix and quartz() for Mac
plot(data$Sub_metering_1~data$Datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col="red")
lines(data$Sub_metering_3~data$Datetime,col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to png file
dev.copy(png, file="plot3.png")
dev.off()