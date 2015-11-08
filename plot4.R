load_data <- function(){
  full_pow_cons<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
  pow_cons<-full_pow_cons[full_pow_cons$Date=='1/2/2007' | full_pow_cons$Date=='2/2/2007',]
  pow_cons$timestamp<- strptime(paste(pow_cons$Date, pow_cons$Time),"%d/%m/%Y %H:%M:%S")
  remove(full_pow_cons)
}

build_chart<-function(){
  load_data()
  png('plot4.png')
  par(mfrow=c(2,2))
  with(pow_cons, {
    #top left chart
    plot(timestamp,Global_active_power, ylab='Global Active Power', xlab='',
         type='l')
    #top right chart
    plot(timestamp,Voltage, ylab='Voltage', xlab='datetime',
         type='l')
    #bottom left chart
    plot(timestamp,Sub_metering_1, ylab='Energy sub metering', xlab='',
         type='l', col='black')
    lines(timestamp,Sub_metering_2, col='red')
    lines(timestamp,Sub_metering_3, col='blue')
    legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
           col=c('black','red','blue'), lty=1, bty='n')
    #bottom right chart
    plot(timestamp,Global_reactive_power, xlab='datetime',
         type='l')
  })
  dev.off()
}

