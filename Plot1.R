## Plot 1 
  ## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
  ## Using the base plotting system, make a plot showing the total PM2.5 emission from 
  ## all sources for each of the years 1999, 2002, 2005, and 2008.

  ## Download Data
      library("data.table")
      path <- getwd()
      download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip",                         sep = "/"))
      unzip(zipfile = "dataFiles.zip")
      scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
      nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
  
  ## Total PM2.5 by year
      totalpm <- tapply(nei$Emissions, nei$year, sum)
      par(mar=c(4,4,4,4), bg="azure", family="HersheySans", lwd=2)
      barplot(height=totalpm, xlab="Year", names.arg=c("1999", "2002", "2005", "2008"), ylab="Pm2.5 Emissions (tons)", ylim=c(0,8000000),                 main="Total PM2.5 Emissions (tons) by Year", col=c("blue", "deepskyblue", "turquoise", "cyan"), cex.names=1)
      dev.off()

  ## Saving Plot 1 as a .png file
      png("plot1.png", width=600, height=600)
      par(mar=c(4,4,4,4), bg="azure", family="HersheySans", lwd=2)
      barplot(height=totalpm, xlab="Year", names.arg=c("1999", "2002", "2005", "2008"), ylab="Pm2.5 Emissions (tons)", ylim=c(0,8000000),                     main="Total PM2.5 Emissions (tons) by Year", col=c("blue", "deepskyblue", "turquoise", "cyan"), cex.names=1)
      dev.off()

