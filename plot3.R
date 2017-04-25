if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}
if(!require(lubridate)){
  install.packages("lubridate")
  library(lubridate)
}
HPC <- fread("household_power_consumption.txt")
HPC <- HPC[Date %in% c("2/2/2007", "1/2/2007")]
HPC$Datetime <- dmy_hms(paste0(HPC$Date," ",HPC$Time))

######################

png(file = "plot3.png")
HPC[,c("Sub_metering_1", 
       "Sub_metering_2", 
       "Sub_metering_3")] <- 
  HPC[,.(as.numeric(Sub_metering_1),
         as.numeric(Sub_metering_2),
         as.numeric(Sub_metering_3))]
yrange <- range(HPC[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), with = FALSE])
xrange <- range(HPC$Datetime)
p3 <- plot(xrange, yrange, type = "n",
           xlab = "", ylab = "Energy sub metering")
lines(HPC$Datetime, HPC$Sub_metering_1, col = "black")
lines(HPC$Datetime, HPC$Sub_metering_2, col = "red")
lines(HPC$Datetime, HPC$Sub_metering_3, col = "blue")
legend("topright",pch = 151, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()