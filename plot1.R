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

png(file = "plot1.png")
hist(as.numeric(HPC$Global_active_power),col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()