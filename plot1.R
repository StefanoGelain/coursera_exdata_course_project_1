dataset <- "household_power_consumption.txt"
  data <- read.table(dataset,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")

  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")

  intervaldates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data <- subset(data, Date %in% intervaldates)
  

#Plot1
  
  png("plot1.png", width=480, height=480)
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  
  dev.off()
