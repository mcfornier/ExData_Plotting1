#dev.copy(png,file="plot1.png",width=400,height=400)
data2<-fread("../household_power_consumption.txt", sep=";",  header=TRUE, na.strings="?")
data <- data2[(data2$Date=='1/2/2007' |data2$Date=='2/2/2007'),]
tmp<- paste(data$Date,data$Time)
tmp<-strptime(tmp, "%d/%m/%Y %H:%M:%S")
data[,Date_f2:=tmp]
data$Global_active_power<-as.numeric(data$Global_active_power)
png(file="plot1.png",width=400,height=400)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()