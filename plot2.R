#plot2
#histogram on the Global active power
hpc <- read.csv("household_power_consumption.txt", sep=";")

#converts the date formating to dd/mm/yyy
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#get the global active power column as numeric for histogram
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

#filter the date with the given value
f_hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02" | hpc$Date == "2007-02-03" ,]

#plot histogram
with(f_hpc , plot( f_hpc$Date , f_hpc$Global_active_power , ylab = "Global Active Power (kilowatts)") )

dev.copy(png , "plot2.png")
dev.off()
