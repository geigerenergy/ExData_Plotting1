plot3<- function(){
  
  file<-'household_power_consumption.txt';
  
  #skip is used so the variable names have to be set manually
  colnames<-c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3');
  
  #skip lines to start from Feb 1st, then only read the next two days (2880)  
  data<-read.table(file, nrows=2880, sep=';', header=TRUE, skip = 66636, na.strings = '?', col.names = colnames);
  
  #set global parameter
  par(cex=0.8);
  
  #generate plot
  plot(data$Sub_metering_1,type='l', axes=FALSE, ylab="Energy sub metering", xlab="");
  
  #add remaining datasets
  lines(data$Sub_metering_2, col='red');
  lines(data$Sub_metering_3, col='blue');
  
  #create new axes
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(0,10,20,30));
  
  #assign legend
  legend('topright', legend=c("Sub_metering_1     ", "Sub_metering_2    ", "Sub_metering_3    "), lty ='solid' , col=c("black", "red", "blue"), cex=0.8, y.intersp=.7);
  box();
  
  #create the plot file
  dev.copy(png, file='plot3.png', units="px", width=480, height=480);
  dev.off();
  
} 