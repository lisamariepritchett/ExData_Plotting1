# Plot 4. Makes 4 plots and saves as png file

## Read in Data and Format
power_df <- read.csv('household_power_consumption.txt', 
                     colClasses =  c('character','character', 
                                     'numeric','numeric','numeric',
                                     'numeric','numeric','numeric'),
                     header = TRUE, sep=';', na.strings = '?', 
                     nrow = 70000)

## Make Date-Time Variable
power_df$DateTime <- strptime( paste(power_df$Date, power_df$Time),
                               format = '%d/%m/%Y %H:%M:%S')

## Set Format of Date and Time variables
power_df$Date  <- strptime( power_df$Date, format = '%d/%m/%Y')
power_df$Time  <- strptime( power_df$Time, format = '%H:%M:%S') 

## Use only data from specified dates
power_df <- power_df [ power_df$Date == "2007-02-01" |  
                           power_df$Date == "2007-02-02" , ]


## Make and Save Plot
png('plot4.png', width = 480, height = 480)

par(mfrow=c(2,2))
plot(power_df$DateTime, power_df$Global_active_power, type = 'l',
    xlab='', ylab='Global Active Power')
plot(power_df$DateTime,power_df$Voltage, type = 'l', xlab = 'datetime',
    ylab = 'Voltage')
plot(power_df$DateTime,power_df$Sub_metering_1, type = 'l',
    xlab= '', ylab = 'Energy sub metering')
lines(power_df$DateTime,power_df$Sub_metering_2, col = 'Red')
lines(power_df$DateTime,power_df$Sub_metering_3, col = 'Blue')
legend("topright", 
       legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = c(1,1,1), col= c('black','red','blue'), bty='n')
plot(power_df$DateTime,power_df$Global_reactive_power, type = 'l',
    xlab='datetime', ylab='Gloabal_reactive_power')

dev.off()