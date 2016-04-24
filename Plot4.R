dataset4 <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", dec=".")
names(dataset4)
dataset4 <- data.frame(dataset4)
str(dataset4)
WorkingData <- dataset4[dataset4$Date %in% c("1/2/2007","2/2/2007"),] 
Global_active_power1<-as.numeric(WorkingData[,3])
datetime <- strptime(paste(WorkingData$Date, WorkingData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(WorkingData$Sub_metering_1)
subMetering2 <- as.numeric(WorkingData$Sub_metering_2)
subMetering3 <- as.numeric(WorkingData$Sub_metering_3)

png('Plot4.png', width = 480, height = 480)

Voltage1<-as.numeric(WorkingData[,5])
Global_reactive_power1<-as.numeric(WorkingData[,4])

par(mfrow = c(2,2))

plot(datetime, Global_active_power1, type= "s", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, Voltage1, type= "s", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="s", col="Grey", ylab = "Energy sub metering", xlab = " ")
lines(datetime, subMetering2, type="l", col="Red")
lines(datetime, subMetering3, type="l", col="Blue")
legend("topright", 
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("Grey", "Red", "Blue"))

plot(datetime, Global_reactive_power1, type= "s", xlab="datetime", ylab="Global Reactive Power (kilowatts)")

dev.off()