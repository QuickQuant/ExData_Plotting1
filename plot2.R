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

png(file = "plot2.png")
yrange <- range(HPC$Global_active_power)
xrange <- range(HPC$Datetime)
p2 <- plot(xrange, yrange, type = "n",
           xlab = "", ylab = "Global Active Power (kilowatts)")
lines(HPC$Datetime, HPC$Global_active_power)