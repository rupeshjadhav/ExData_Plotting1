mydata <- read.table("household_power_consumption.txt", sep=';', na.string="?", header=T)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
data <- subset(mydata, subset =(Date >="2007-02-01" & Date <="2007-02-02" ))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
        plot(Datetime, Sub_metering_1 , type="l" , xlab="",  ylab="Energy sub metering")
        lines(Datetime,Sub_metering_2 ,col='Red') 
        lines(Datetime,Sub_metering_3 ,col='Blue') 
        
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 



dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

