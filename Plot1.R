dataset <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", dec=".")
names(dataset)
dataset <- data.frame(dataset)
str(dataset)
WorkingData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),] 
Date1 <- as.Date(WorkingData[,1], format = "%d/%m/%Y")
Global_active_power1 <- as.numeric(WorkingData[,3])

png('Plot1.png', width= 480, height = 480)
hist(Global_active_power1, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()