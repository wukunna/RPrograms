## plot1.R
## Coursera: Exploratory Data Analysis
## Project 1 Part 1
## This program loads the data and generates a histogram for the frequency of 
## global active power. The plot is saved as plot1.png
## 

# change the working directory
# please change the working directory to the folder containing the data file
# setwd('./Project 1')

## Load data
file <- "household_power_consumption.txt"

# # get a feel of the data
# read.table(file, nrows=3, header=T, sep=";", stringsAsFactors=F, dec=".")
# # find the number of rows to skip, and plus 1 for header
# start <- strptime("2006-12-16 17:24:00", format = "%Y-%m-%d %H:%M:%S")
# read_start <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
# difftime(read_start,start,units="min")
# # find the number of rows to read
# read_end <- strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S")
# difftime(read_end,read_start,units="min")

# read the data
colnames = c("Date","Time",
             "Global_active_power","Global_reactive_power",
             "Voltage","Global_intensity",
             "Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table(file, skip=66637, nrows=2880, header=F, col.names=colnames,
                   sep=";", stringsAsFactors=F, dec=".", na.strings="?")

## Plot the histogram
windows() # using x11() for unix and quartz() for Mac
hist(data$Global_active_power,col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")

## Save to png file
dev.copy(png,file="plot1.png")
dev.off()