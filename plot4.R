#plot4
#histogram on the Global active power
hpc <- read.csv("household_power_consumption.txt", sep=";")

#converts the date formating to dd/mm/yyy
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#get the global active power column as numeric for histogram
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

#filter the date with the given value
f_hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02" | hpc$Date == "2007-02-03" ,]

#filter global active power
#gap <-  f_hpc$Global_active_power

#plot histogram
par(mfrow = c(2,2))

with(f_hpc , {
    
    #1st
    plot(Date , Global_active_power , ylab = "Global Active Power (kilowatts)")
  
    #2nd
    plot(Date ,Voltage , xlab = "Date" , ylab = "Voltage")
    
    #4th
    plot(Date ,Global_reactive_power , xlab = "Date" ,ylab = "Global_reactive_power")
    
    
   #3rd
    with(f_hpc , plot( f_hpc$Date , f_hpc$Sub_metering_1 , col = "black" , ylab = "Energy sub metering" ))
    with(f_hpc , plot( f_hpc$Date , f_hpc$Sub_metering_2 , col = "red"  ,  ylab = "Energy sub metering" ))
    with(f_hpc , plot( f_hpc$Date , f_hpc$Sub_metering_3 , col = "blue" ,  ylab = "Energy sub metering" ))
    legend("topright" , legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3") , bty = "n" , lwd = 2 ,  col = c("black" , "red" , "blue") , lty = c(1,1,1) , pch = c(NA,NA,NA))
      
})

dev.copy(png , "plot4.png")
dev.off()
