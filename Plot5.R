## Plot 5 
    ## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
      
    ## Download Data
      library("data.table")
      path <- getwd()
      download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip", sep = "/"))
      unzip(zipfile = "dataFiles.zip")
      scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
      nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
 
    ## Subset Data
      library(dplyr)
      vehicle <- grepl("vehicle", scc[, SCC.Level.Two], ignore.case=TRUE)
      scc_vehicle <- scc[vehicle, SCC]
      nei_vehicle <- nei[nei[, SCC] %in% scc_vehicle,]
      baltimore_vehicle <- nei_vehicle[fips=="24510",]
      baltimore_pmdata <-summarise(group_by(filter(baltimore_vehicle), year), Emissions=sum(Emissions))

   ## Plot 5
    library(ggplot2)
    g <- ggplot(baltimore_pmdata, aes(factor(year), Emissions)) + geom_bar(stat="identity", fill=c("midnightblue", "skyblue4", "mediumslateblue", "royalblue")) + theme_minimal(base_size = 11, base_family = "sans", base_line_size = 2, base_rect_size = 2) + xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("Baltimore PM2.5 Vehicle Emissions by Year and Type")

  ## Saving Plot 5 as a .png file
      png("plot5.png", width=600, height=600)
        g <- ggplot(baltimore_pmdata, aes(factor(year), Emissions)) + geom_bar(stat="identity", fill=c("midnightblue", "skyblue4", "mediumslateblue", "royalblue")) + theme_minimal(base_size = 11, base_family = "sans", base_line_size = 2, base_rect_size = 2) + xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("Baltimore PM2.5 Vehicle Emissions by Year and Type")
        print(g)
      dev.off()
