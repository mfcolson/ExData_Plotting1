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

#Plot2 Global active power by date

plot(tmp[,10],tmp[,3],
     type ="l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
