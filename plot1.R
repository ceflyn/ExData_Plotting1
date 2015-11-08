load_data <- function(){
  full_pow_cons<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
  pow_cons<-full_pow_cons[full_pow_cons$Date=='1/2/2007' | full_pow_cons$Date=='2/2/2007',]
  pow_cons$timestamp<- format(as.POSIXct(paste(pow_cons$Date, pow_cons$Time)), "%d/%m/%Y %H:%M:%S")
  remove(full_pow_cons)
}

build_chart<-function(){
  load_data()
  png('plot1.png')
  hist(pow_cons$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)',
       col='red', ylim=range(0,1200))
  dev.off()
}
