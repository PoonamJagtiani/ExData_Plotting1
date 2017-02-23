# Getting full dataset
trial <- "household_power_consumption.txt"
fi <- file(trial)
df <- read.csv(fi,header=TRUE,sep=';',na.strings="?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
# subsetting the dates
data <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Generating the Plot 1
hist(as.numeric(data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
