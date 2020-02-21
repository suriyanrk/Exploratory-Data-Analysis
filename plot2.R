setwd("/home/srk/Desktop/Exploratory-Data-Analysis")

data_full <- read.csv("household_power_consumption.txt", header=T, 
                      sep=';', na.strings="?", nrows=2075259, check.names=F,
                      stringsAsFactors=F, comment.char="", quote='\"')
datar <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
datar$Date <- as.Date(datar$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datar$Date), datar$Time)
datar$Datetime <- as.POSIXct(datetime)

## Plot 2
with(datar, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()