#plot2
dir("./data")
filename <- "./data/household_power_consumption.txt"
data1 <- read.table(filename,stringsAsFactors = FALSE,dec = ".",sep = ";",header = TRUE)
head(data1)
names(data1)
#subsetting data
subdata <- subset(data1,Date=="1/2/2007"|Date =="2/2/2007")
head(subdata)
sapply(subdata, class)
#plot2
time <- strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")
head(time)
Sys.setlocale("LC_TIME", "C")
with(data1, plot(time,as.numeric(subdata$Global_active_power),type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.copy(png,file = "plot2.png",width=480, height=480)
dev.off()