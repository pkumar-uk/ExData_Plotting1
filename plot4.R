# plot4.R produces a 4 charts and saves it to file plot4.png
#
# Chart 1 - Global Active Poweron the two days
# Chart 2 - Voltage variotion on 2 days
# Chart 3 - Energy sub metering on the two days
# Chart 4 - Global reactive power variation on two days

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

# convert Date field 
outcome1$Date <- as.Date(outcome1$Date,format="%d/%m/%Y")

# subset on the two days
outcome1 <- subset(outcome1, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))

# Convert Time field
outcome1$Time <- strptime(outcome1$Time, "%d/%m/%Y %H:%M:%OS")

# plotting starts here

# set the file to copy plot to and set the width as mentioned
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

# logicall break the screen into 4 cells for plotting
par(mfrow=c(2,2))

# plot 1st chart
plot(outcome1$Time,outcome1$Global_active_power,type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# plot 2nd chart
plot(outcome1$Time,outcome1$Voltage,type="l", 
     xlab="datetime", ylab="Voltage")

# Plot 3rd chart

plot(outcome1$Time,outcome1$Sub_metering_1,type="l", 
     xlab="", ylab="Energy sub metering")
points(outcome1$Time,outcome1$Sub_metering_2,type="l", col="red")
points(outcome1$Time,outcome1$Sub_metering_3,type="l", col="blue")


legend("topright", .7, col=c("black","red","blue"), bty="n", lty=c(1,1), lwd=c(2,2,2),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)

#plot 4th chart
plot(outcome1$Time,outcome1$Global_reactive_power,type="l", 
     xlab="datetime", ylab="Global_reactive_power")


#close the device
dev.off()
