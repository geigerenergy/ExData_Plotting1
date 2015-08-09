plot1<- function(){
  
  file<-'household_power_consumption.txt';
  
  #skip is used so the variable names have to be set manually
  colnames<-c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3');
  
  #skip lines to start from Feb 1st, then only read the next two days (2880)  
  data<-read.table(file, nrows=2880, sep=';', header=TRUE, skip = 66636, na.strings = '?', col.names = colnames);

  #generate histogram
  histogram<-hist(test$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)" );

  #create the plot file
  dev.copy(png,  file='plot1.png', units="px", width=480, height=480);
  dev.off();
  
} 