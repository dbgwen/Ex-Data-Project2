## Plot 2
  ## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") 
  ## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
    
  ## Download Data
      library("data.table")
      path <- getwd()
      download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip", sep = "/"))
      unzip(zipfile = "dataFiles.zip")
      scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
      nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

  ## Plot Total Emissions for Baltimore City
      baltimore <- subset (nei, fips == "24510")
      pmdata <- tapply(baltimore$Emissions, baltimore$year, sum)
      par(mar=c(4,4,4,4), bg="grey20", fg="azure", col.axis="azure", col.lab="azure", col.main="azure", col.sub="azure", family="HersheySans", lwd=2)
      barplot(height=pmdata, xlab="Year", names.arg=c("1999", "2002", "2005", "2008"), ylab="Pm2.5 Emissions (tons)", ylim=c(0,3500), main="Total PM2.5 Emissions (tons) in Baltimore, by Year", col=c("deeppink", "dodgerblue", "green3", "gold"))
      
      dev.off()
      
      
  ## Saving Plot 2 as a .png file
      png("plot2.png", width=600, height=600)
      par(mar=c(4,4,4,4), bg="grey20", fg="azure", col.axis="azure", col.lab="azure", col.main="azure", col.sub="azure", family="HersheySans", lwd=2)
      barplot(height=pmdata, xlab="Year", names.arg=c("1999", "2002", "2005", "2008"), ylab="Pm2.5 Emissions (tons)", ylim=c(0,3500), main="Total PM2.5 Emissions (tons) in Baltimore, by Year", col=c("deeppink", "dodgerblue", "green3", "gold"))
      dev.off()
