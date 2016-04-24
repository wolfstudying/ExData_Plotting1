dataset2 <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", dec=".")
names(dataset2)
dataset2 <- data.frame(dataset2)
str(dataset2)
WorkingData <- dataset2[dataset2$Date %in% c("1/2/2007","2/2/2007"),] 
datetime <- strptime(paste(WorkingData$Date, WorkingData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power1 <- as.numeric(WorkingData[,3])

png('Plot2.png', width= 480, height = 480)
plot(datetime, Global_active_power1, type= "s", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()