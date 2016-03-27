#------------------------------------------------------------------------------------------------
# Exploratory Data Analysis
# Wk1 Assignment
# plot2.R
# Purpose - Create Plot 2 as demonstrated in assignment, and save to PNG file
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
## PLOT 2
#------------------------------------------------------------------------------------------------
dev.off()
par( mfrow = c(1,1) )

datetimes <- paste( powcon.df$Date, powcon.df$Time )
datetimes <- strptime( datetimes, '%d/%m/%Y %H:%M:%S' )
plot( datetimes, powcon.df$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "" )

# Save as PNG
dev.copy( png, "plot2.png", width = 480, height = 480 )
dev.off()

