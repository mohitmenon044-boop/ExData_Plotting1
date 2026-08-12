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


# Open a PNG device
png('plot1.png', width=480,height = 480)

# Draw the plot
hist(df$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

# Close the device
dev.off()




























