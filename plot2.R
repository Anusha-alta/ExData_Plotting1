
library("sqldf")
library("graphics")


# read data from household_power_consumption.txt for 1st Feb 2007 and 2nd Feb 2007. 

df1 <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, sql = "select * from file where date in ('1/2/2007', '2/2/2007')")

# Histogram for Global active power

df1$DateTime <- paste(df1$Date, df1$Time, sep="")

hist(df1$Global_active_power, xlab = "Global Active Power (Kilowatts)", col = "red", main="Global Active Power")
df1$DTformatted <- strptime(df1$DateTime, format='%d/%m/%Y %H:%M:%S')

plot(df1$DTformatted, df1$Global_active_power, type='l')
