## plot2.R
## Coursera: Exploratory Data Analysis
## Project 1 Part 2
## This program loads the data and plots the time series data of Global Active 
## Power. The plot is saved as plot2.png
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
                   sep=";", stringsAsFactors=F, dec=".", na.strings="?")

## Converting the dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(data$Date,data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the time series Global Active Power data
windows() # using x11() for unix and quartz() for Mac
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to png file
dev.copy(png, file="plot2.png")
dev.off()