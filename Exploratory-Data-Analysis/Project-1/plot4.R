## plot4.R
## Coursera: Exploratory Data Analysis
## Project 1 Part 4
## This program loads the data and plots the time series data as 2x2 subplots
## The plot is saved as plot4.png
## 

# ## change the working directory to the folder containing the data file
# setwd('./Project 1')

## Load data
file <- "household_power_consumption.txt"

# read the data
colnames = c("Date","Time",
             "Global_active_power","Global_reactive_power",
             "Voltage","Global_intensity",
             "Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table(file, skip=66637, nrows=2880, header=F, col.names=colnames,
                   sep=";", stringsAsFactors=F, dec=".", na.strings="?")


## Converting the dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(data$Date,data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the time series Global Active Power data
windows() # using x11() for unix and quartz() for Mac
par(mfrow=c(2,2))

# plot (1,1)
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power", xlab="")

# plot (1,2)
plot(data$Voltage~data$Datetime, type="l", 
     ylab="Voltage", xlab="datetime")

# plot (2,1)
plot(data$Sub_metering_1~data$Datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='red')
lines(data$Sub_metering_3~data$Datetime,col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (2,2)
plot(data$Global_reactive_power~data$Datetime, type="l", 
     ylab="Global_reactive_power",xlab="datetime")


## Save to png file
dev.copy(png, file="plot4.png")
dev.off()