# Read in the full data (assumed to be in the working directory)  
fileData<-read.table("household_power_consumption.txt", header=TRUE, sep=';')  

DateAndTime<-strptime(paste(fileData[,1], fileData[,2]), "%d/%m/%Y %H:%M:%S")

# indices of the data between 2007-02-01 and 2007-02-02
DateCharVector<-strftime(DateAndTime, format="%Y:%m:%d");
RegionOfInterest<-"2007:02:01" == DateCharVector | "2007:02:02" == DateCharVector;
DataFrameOfInterest<- fileData[RegionOfInterest,];

# do the plotting stuff
png("plot3.png", width = 480, height = 480);

plot(
  DateAndTime[which(RegionOfInterest)],
  as.numeric(as.vector(DataFrameOfInterest$Sub_metering_1)),
  "l",
  col='black',
  main = "",
  ylab = "Energy sub metering",
  xlab = ""
);

lines(
  DateAndTime[which(RegionOfInterest)],
  as.numeric(as.vector(DataFrameOfInterest$Sub_metering_2)),
  col='red');

lines(
  DateAndTime[which(RegionOfInterest)],
  as.numeric(as.vector(DataFrameOfInterest$Sub_metering_3)),
  col='blue');

legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=c(1,1),
  col=c("Black", "Red", "Blue"),
  cex = 0.75
  )

dev.off()