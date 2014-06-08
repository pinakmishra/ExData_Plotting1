#plot1
#histogram on the Global active power
hpc <- read.csv("household_power_consumption.txt", sep=";")

#converts the date formating to dd/mm/yyy
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#get the global active power column as numeric for histogram
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

#filter the date with the given values
f_hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

#filter global active power
gap <-  f_hpc$Global_active_power

#plot histogram
with(f_hpc , hist( gap , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency" , main = "Global Active Power" , col ="red") )

dev.copy(png , "plot1.png")
dev.off()

