setwd('C:\\Users\\Matthew\\Documents\\school\\coursera\\EDA\\project1_eda')
nrgdata <- read.table(file.choose(),header = T, sep = ';', dec=".")
library(lubridate)
library(tidyr)
tmp <- subset(nrgdata, nrgdata[,1] == "1/2/2007" | nrgdata[,1] == "2/2/2007")
rm(nrgdata)
tmp[,3] <- as.numeric(as.character(tmp$Global_active_power))
tmp[,1] <-as.Date(tmp[,1], format = "%d/%m/%Y")
tmp[,2] <-as.character(tmp[,2])
tmp[,10] <- interaction(tmp[,1],tmp[,2], sep=" ")
tmp[,10] <- as.POSIXct(tmp[,10])

#Plot4 4 plots,plot2, voltage by date, plot3, global reactive power by date 
 
par(mfrow=c(2,2))

#1 

plot(tmp[,10],tmp[,3],
     type ="l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
#2 
plot(tmp[,10],tmp$Voltage,
     type="l",
     ylab= "Voltage",
     xlab= "datetime")
#3
plot(tmp[,10],as.character(tmp$Sub_metering_1),
     type="l",
        xlab="",
     ylab="Energy sub-metering"
     )
lines(tmp[,10],as.character(tmp$Sub_metering_2),
      type = "l",
      col = "red"
      )
lines(tmp[,10], as.character(tmp$Sub_metering_3),
      type="l",
      col = "blue"
      )
legend( "topright", 
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       cex=0.3,
       lty = c(1,1,1),
       col=c('black','red','blue')
        )
#4
plot(tmp[,10], as.character(tmp$Global_reactive_power),
                            ylab = "Global_reactive_power",
                            xlab = "datetime",
                            type = "l",
                            col="black")

