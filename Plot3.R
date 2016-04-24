dataset3 <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", dec=".")
names(dataset3)
dataset3 <- data.frame(dataset3)
str(dataset3)
WorkingData <- dataset3[dataset3$Date %in% c("1/2/2007","2/2/2007"),] 
Date1<-as.Date(WorkingData[,1], format = "%d/%m/%Y")
datetime <- strptime(paste(WorkingData$Date, WorkingData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(WorkingData$Sub_metering_1)
subMetering2 <- as.numeric(WorkingData$Sub_metering_2)
subMetering3 <- as.numeric(WorkingData$Sub_metering_3)

png('Plot3.png', width = 480, height = 480)
plot(datetime, subMetering1, type="s", col="Grey", ylab = "Energy sub metering", xlab = " ")
lines(datetime, subMetering2, type="l", col="Red")
lines(datetime, subMetering3, type="l", col="Blue")
legend("topright", 
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("Grey", "Red", "Blue"))

dev.off()