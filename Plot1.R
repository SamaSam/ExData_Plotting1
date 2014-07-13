# Read in the full data (assumed to be in the working directory)  
fileData<-read.table("household_power_consumption.txt", header=TRUE, sep=';')  

DateAndTime<-strptime(paste(fileData[,1], fileData[,2]), "%d/%m/%Y %H:%M:%S")

# indices of the data between 2007-02-01 and 2007-02-02
DateCharVector<-strftime(DateAndTime, format="%Y:%m:%d");
RegionOfInterest<-"2007:02:01" == DateCharVector | "2007:02:02" == DateCharVector;
DataFrameOfInterest<- fileData[RegionOfInterest,];

# do the plotting stuff
png("plot1.png", width = 480, height = 480);
hist(
  as.numeric(as.vector(DataFrameOfInterest$Global_active_power)),
  col='red',
  main="Global Active Power",xlab="Global Active Power (KiloWatts)")
dev.off()