# plot3.R produces a line plot  and saves it to file plot3.png
# Engergy sub metering values on the two days

# Pre-requiste
# the program depends on data from site 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extract the zip file and make sure it is saved in the current working directory
# with the name 'household_power_consumption.txt'
#
# Note: the png file is stored in your current working directory
#
# all analysis only for two dates data 2007-02-01 and 2007-02-02
# 
# Read the data from file 
outcome1 <- read.csv("./household_power_consumption.txt", sep=";",
                     header=TRUE,na.strings="?")

# Modify the Time field to store Date and Time
outcome1$Time <- paste(outcome1$Date," ", outcome1$Time)

# convert Date to date format
outcome1$Date <- as.Date(outcome1$Date,format="%d/%m/%Y")

# filter data
outcome1 <- subset(outcome1, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))

# convert Time field to date-time format
outcome1$Time <- strptime(outcome1$Time, "%d/%m/%Y %H:%M:%OS")

# plotting starts from here

# make sure about the grid
par(mfrow=c(1,1))

# set the file to copy plot to and set the width as mentioned
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(outcome1$Time,outcome1$Sub_metering_1,type="l", 
     xlab="", ylab="Energy sub metering")

points(outcome1$Time,outcome1$Sub_metering_2,type="l", col="red")

points(outcome1$Time,outcome1$Sub_metering_3,type="l", col="blue")

# add legend
legend("topright",  col=c("black","red","blue"), lty=c(1,1), lwd=c(2,2,2),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
