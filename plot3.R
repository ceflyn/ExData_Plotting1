load_data <- function(){
  full_pow_cons<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
  pow_cons<-full_pow_cons[full_pow_cons$Date=='1/2/2007' | full_pow_cons$Date=='2/2/2007',]
  pow_cons$timestamp<- strptime(paste(pow_cons$Date, pow_cons$Time),"%d/%m/%Y %H:%M:%S")
  remove(full_pow_cons)
}

build_chart<-function(){
  load_data()
  png('plot3.png')
  plot(pow_cons$timestamp,pow_cons$Sub_metering_1, ylab='Energy sub metering', xlab='',
       type='l', col='black')
  lines(pow_cons$timestamp,pow_cons$Sub_metering_2, col='red')
  lines(pow_cons$timestamp,pow_cons$Sub_metering_3, col='blue')
  legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
         col=c('black','red','blue'), lty=1)
  dev.off()
}

