## Plot 6 
    ## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
    ## motor vehicle sources in Los Angeles County, California (fips=="06037"). 
    ## Which city has seen greater changes over time in motor vehicle emissions?
      
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
      
      baltimore <- nei_vehicle[fips == "24510",]
      baltimore[, city := c("Baltimore City")]

      la <- nei_vehicle[fips == "06037",]
      la[, city := c("Los Angeles")]
      cities_pmdata <- rbind(la,baltimore)
      library(ggplot2)
      
     ## Graph 6
      g <- ggplot(data=cities_pmdata, aes(x=factor(year), fill=city, y=Emissions)) + geom_bar(stat= "identity") + facet_grid(.~city) +            xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("PM2.5 Emissions by Year for Baltimore and Los Angeles") +       scale_fill_brewer(palette = "Accent") + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1)    
      
      ## Saving Plot 6 as a .png
       png("plot6.png", width=600, height=600)
         g <- ggplot(data=cities_pmdata, aes(x=factor(year), fill=city, y=Emissions)) + geom_bar(stat= "identity") + facet_grid(.~city) + xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("PM2.5 Emissions by Year for Baltimore and Los Angeles") +       scale_fill_brewer(palette = "Accent") + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1)    
      print(g)
      dev.off()

     
