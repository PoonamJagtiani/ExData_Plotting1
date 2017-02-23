# Getting full dataset
trial <- "household_power_consumption.txt"
fi <- file(trial)
df <- read.csv(fi,header=TRUE,sep=';',na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# subsetting the dates
data <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting date times
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Generating the plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, plot(Datetime,Global_active_power,type="l",ylab="Global Active Power(Kilowatts)",xlab=""))
with(data, plot(Datetime,Voltage,type="l",ylab="Voltage",xlab=""))
with(data, plot(Datetime,Sub_metering_1,type="l",ylab="Global Active Power(Kilowatts)",xlab="",yaxt="n"))
axis(side=2,at=c(0,10,20,30))
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data, plot(Datetime,Global_reactive_power,type="l",ylab="Global Active Power(Kilowatts)",xlab=""))
