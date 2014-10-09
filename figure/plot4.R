mydata <- read.table("household_power_consumption.txt", sep=';', na.string="?", header=T)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
data <- subset(mydata, subset =(Date >="2007-02-01" & Date <="2007-02-02" ))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 

plot(data$Global_active_power ~ data$Datetime  , type="l" , xlab="",  ylab="Global Active Power")

plot(data$Voltage ~ data$Datetime  , type="l" , xlab="datetime",  ylab="Voltage")


with(data, {
        plot(Datetime, Sub_metering_1 , type="l" , xlab="",  ylab="Energy sub metering")
        lines(Datetime,Sub_metering_2 ,col='Red') 
        lines(Datetime,Sub_metering_3 ,col='Blue') 
        
})

legend(locator(1), col=c("black", "red", "blue"), lty=1, lwd=2,bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 


plot(data$Global_reactive_power ~ data$Datetime  , type="l" , xlab="datetime",  ylab="Global Reactive Power")


dev.copy(png, file="plot5.png", height=480, width=480) 
dev.off() 
