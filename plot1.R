mydata <- read.table("household_power_consumption.txt", sep=';', na.string="?", header=T)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
data <- subset(mydata, subset =(Date >="2007-02-01" & Date <="2007-02-02" ))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

hist(data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

