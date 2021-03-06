#------------------------------------------------------------------------------------------------
# Exploratory Data Analysis
# Wk1 Assignment
# plot3.R
# Purpose - Create Plot 3 as demonstrated in assignment, and save to PNG file
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
# 1 Loading the data
#------------------------------------------------------------------------------------------------

# 1.1 Download file
urlstr <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filenm <- "power.zip"
download.file( urlstr, filenm )

# 1.01 Unzip
unzip( filenm ) #, exdir="wear" )

# 1.02 Load data
# We will only be using data from the dates 2007-02-01 and 2007-02-02
# Using sqldf to do subsetting while reading; uncomment run the next two if necessary 

# install.packages("sqldf")
# library(sqldf)

# Define file
powcon <- file( "household_power_consumption.txt" )
attr( powcon, "file.format" ) <- list( sep=";", header = TRUE )

# Run sqldf to get only needed rows
powcon.df <- sqldf( "SELECT * FROM powcon WHERE DATE IN ('01/02/2007','02/02/2007','1/2/2007','2/2/2007')  ")
sqldf()

#------------------------------------------------------------------------------------------------
# For each plot you should
# 
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# 
# Name each of the plot files as plot1.png, plot2.png, etc.

#------------------------------------------------------------------------------------------------
## PLOT 3
#------------------------------------------------------------------------------------------------
dev.off()
par( mfrow = c(1,1) )

plot( datetimes, powcon.df$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "" )
lines( datetimes, powcon.df$Sub_metering_2, type="l", xlab = "", col = "red" )
lines( datetimes, powcon.df$Sub_metering_3, type="l", xlab = "", col = "blue" )
legend( "topright", legend=c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue" ),lty = 1 )

# Save as PNG
dev.copy( png, "plot3.png", width = 480, height = 480 )
dev.off()

