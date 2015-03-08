## Explore and Analyze Data - Project 1 - Plot 1
#
#
# The data used in this program comes from the following location:
# Dataset: Electric power consumption [20Mb]
#
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# ******************************** IMPORTANT ****************************************
# The unzipped data file must be loaded into a subdirectory call "./data" for this 
# program to work.  The default name of the file must be kept. 
# ******************************** IMPORTANT ****************************************

# install any package is not already installed but needed in this program 
#   (manually remove "#" if library has not been installed before)

# install.packages("lubridate")
# install.packages("dplyr")

# Load required libraries
library(lubridate)
library(dplyr)

# Read in the source data from the ./data subdirectory

epdata = read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# epdata = read.table("./data/household_power_consumption.txt", header=TRUE, sep=";")

# Add a new Date column, Date1, that is the converted Date field from a Factor to a 
# Date field and filter the data table for the two dates of interested, 2007-02-01 
# and 2007-02-02

epdata = mutate(epdata, Date1 = as.Date(epdata$Date, format="%d/%m/%Y"))

target1 = as.Date("2007-02-01")
target2 = as.Date("2007-02-02")
plotepdata = filter(epdata, Date1 >= target1, Date1 <= target2)

# Create a Timestame column
epdat = within(plotepdata, { Timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")})

# Create and copy histogram to png file of size 480x480 pixels
# make the left margin a bit larger before plotting
par(mar = c(5.1, 5, 4.1, 2.1))

hist(epdat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()



