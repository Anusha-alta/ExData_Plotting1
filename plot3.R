
library("graphics")


# read data from household_power_consumption.txt for 1st Feb 2007 and 2nd Feb 2007. 

df1 <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, sql = "select * from file where date in ('1/2/2007', '2/2/2007')")

# Combine Date and Time column to create new DateTime column
df1$DateTime <- paste(df1$Date, df1$Time, sep="")
# Convert DateTime to date format - create new columns DTformatted
df1$DTformatted <- strptime(df1$DateTime, format='%d/%m/%Y %H:%M:%S')
#Plot Sub_metering_1 on Y axis. X axis = Datetime column

plot(df1$DTformatted, df1$Sub_metering_1, type = 'l', ylab="Energy sub metering", xlab="")

# Add variable Sub_metering_2 with color blue
lines(df1$DTformatted, df1$Sub_metering_3, col="blue")

# Add variable Sub_metering_3 - color = red.
lines(df1$DTformatted, df1$Sub_metering_2, col="red") 

# Add legend to the graph.
legend("topright",legend = levels(subMeterTidy$subMeterType), col = c("black","blue","red"),lty = 1)