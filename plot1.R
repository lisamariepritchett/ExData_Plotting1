# Plot Histogram for Global Active Power

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

## Plot and Save histogram
png('plot1.png', width = 480, height = 480)
hist(power_df$Global_active_power, col = 'Red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()
    
