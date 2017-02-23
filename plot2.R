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

# Generating the plot 2
with(data, plot(Datetime,Global_active_power,type="l",ylab="Global Active Power(Kilowatts)",xlab=""))