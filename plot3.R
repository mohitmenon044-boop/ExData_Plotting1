# Load the required library
library(data.table)

# Download dataset
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip', mode = 'wb')

# Unzip dataset
unzip('household_power_consumption.zip')

# Load the data set
df<- fread('household_power_consumption.txt', na.strings = '?')
# Date/time classes and subsetting based on the dates
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')

df<- df[Date %in% as.Date(c('2007-02-01','2007-02-02'))]

# Make a new datetime variable
df$datetime<- as.POSIXct(paste(df$Date, df$Time), format = "%Y- %m- %d %H:%M:%S")

# Open a PNG device
png('plot3.png', width=480,height = 480)

# Draw the plot
plot(df$datetime, df$Sub_metering_1, type = 'l', ylab = 'Energy Sub-Metering', xlab = "")

# Add in the extra lines for Sub_meterin_2 and sub_meterin_3
lines(df$datetime, df$Sub_metering_2, col = 'red')
lines(df$datetime, df$Sub_metering_3, col = 'blue')

# Add in the legend
legend('topright', lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))

# Close the device
dev.off()





