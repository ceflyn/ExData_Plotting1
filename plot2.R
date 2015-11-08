load_data <- function(){
  full_pow_cons<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
  pow_cons<-full_pow_cons[full_pow_cons$Date=='1/2/2007' | full_pow_cons$Date=='2/2/2007',]
  pow_cons$timestamp<- strptime(paste(pow_cons$Date, pow_cons$Time),"%d/%m/%Y %H:%M:%S")
  remove(full_pow_cons)
}

build_chart<-function(){
  load_data()
  png('plot2.png')
  plot(pow_cons$timestamp,pow_cons$Global_active_power, ylab='Global Active Power', xlab='',
       type='l')
  dev.off()
}

