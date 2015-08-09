plot2<- function(){
  
  file<-'household_power_consumption.txt';
  
  #skip is used so the variable names have to be set manually
  colnames<-c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3');
  
  #skip lines to start from Feb 1st, then only read the next two days (2880)  
  data<-read.table(file, nrows=2880, sep=';', header=TRUE, skip = 66636, na.strings = '?', col.names = colnames);
  
  #set global parameter
  par(cex=0.8);
  
  #generate plot
  plot(data$Global_active_power, type="l", axes=FALSE, ylab="Global Active Power (kilowatts)", xlab="");
  axis(side=1, at=c(0,1440,2880), labels=c('Thu', 'Fri', 'Sat'));
  axis(side=2, at=c(0,2,4,6));
  box();
  
  #create the plot file
  dev.copy(png, file='plot2.png', units="px", width=480, height=480);
  dev.off();
  
} 