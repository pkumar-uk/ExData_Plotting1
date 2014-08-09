# plot1.R produces a histogram and saves it to file plot1.png

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

# convert the Date that is read as character to Date format
outcome1$Date <- as.Date(outcome1$Date,format="%d/%m/%Y")
#
# filter data for the two dates
outcome1 <- subset(outcome1, Date == as.Date("2007/02/01") | Date == as.Date("2007/02/02"))
#
# plotting starts from here
#
# make sure about the grid
par(mfrow=c(1,1))

# set the file to copy plot to and set the width as mentioned
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
#
# plot
hist(outcome1$Global_active_power,col="red", main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency")

# close the device
dev.off()

