#Read File
input<-read.csv("/Users/nikolaoslamprou/Desktop/Data Science/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE)
#Select Date Range
input$Date<-as.Date(input$Date,"%d/%m/%Y")
input<-input[input$Date >= '2007-02-01',]
input<-input[input$Date <= '2007-02-02',] 
#Convert Data types
input$Time<-as.POSIXct(paste(input$Date,input$Time), format="%Y-%m-%d %H:%M:%S")
input$Global_active_power<-as.numeric(input$Global_active_power)
input$Global_reactive_power<-as.numeric(input$Global_reactive_power) 
input$Voltage<-as.numeric(input$Voltage)
input$Global_intensity<-as.numeric(input$Global_intensity)
input$Sub_metering_1<-as.numeric(input$Sub_metering_1)
input$Sub_metering_2<-as.numeric(input$Sub_metering_2)
input$Sub_metering_3<-as.numeric(input$Sub_metering_3)
#Open File
png(filename="/Users/nikolaoslamprou/Desktop/Data Science/plot3.png",width = 480, height = 480, units = "px")
#Plot
plot(input$Time,input$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(input$Time,input$Sub_metering_2,type="l",col="red")
lines(input$Time,input$Sub_metering_3,type="l",col="blue")
legend('topright', names(input[,7:9]),bty = "o",lty=1, col=c('black', 'red', 'blue'), cex=.75)
#Close file
dev.off()