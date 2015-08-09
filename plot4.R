plot4<- function(){
  
  file<-'household_power_consumption.txt';
  
  #skip is used so the variable names have to be set manually
  colnames<-c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3');
  
  #skip lines to start from Feb 1st, then only read the next two days (2880)  
  data<-read.table(file, nrows=2880, sep=';', header=TRUE, skip = 66636, na.strings = '?', col.names = colnames);
  
  #set global parameter
  par(mfrow=c(2,2), cex=0.6);
  
  #create the first plot
  plot(data$Global_active_power, type="l", axes=FALSE, ylab="Global Active Power", xlab="");
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(0,2,4,6));
  box();
  
  #create the second plot
  plot(data$Voltage, type="l", axes=FALSE, ylab="Voltage", xlab="datetime");
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(234,238,242,246));
  box();
  
  #create third plot
  plot(data$Sub_metering_1,type='l', axes=FALSE, ylab="Energy sub metering", xlab="");
  lines(data$Sub_metering_2, col='red');
  lines(data$Sub_metering_3, col='blue');
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(0,10,20,30));
  legend('topright', legend=c("Sub_metering_1     ", "Sub_metering_2    ", "Sub_metering_3    "), lty="solid", bty ='n' , col=c("black", "red", "blue"), y.intersp=.5);
  box();
  
  #create fourth plot
  plot(data$Global_reactive_power, type="l", axes=FALSE, ylab="Global_reactive_power", xlab="datetime");
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5));
  box();
  
  #create the plot file
  dev.copy(png, file='plot4.png', units="px", width=480, height=480);
  dev.off();
  
} 