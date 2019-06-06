## Plot 3 
  ## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
  ## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
  ## Which have seen increases in emissions from 1999–2008? 
  ## Use the ggplot2 plotting system to make a plot answer this question.
      
  ## Download Data
      library("data.table")
      path <- getwd()
      download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip",                       sep = "/"))
      unzip(zipfile = "dataFiles.zip")
      scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
      nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
  
  ## In Baltimore city - four sources with most decrease
      library(dplyr)     
      baltimore <- subset (nei, fips == "24510")
      baltimore_pmdata <-summarise(group_by(filter(baltimore), year,type), Emissions=sum(Emissions))
      library(ggplot2)
      g <- ggplot(data=baltimore_pmdata, aes(x=factor(year), fill=type, y=Emissions)) + geom_bar(stat= "identity") + facet_grid(.~type) +            xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("Baltimore PM2.5 Emissions by Year and Type") +       scale_fill_brewer(palette = "Dark2") + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1)    
 
 
   ## Saving Plot 3 as a .png file
      png("plot3.png", width=600, height=600)
       g <- ggplot(data=baltimore_pmdata, aes(x=factor(year), fill=type, y=Emissions)) + geom_bar(stat= "identity") + facet_grid(.~type) +            xlab("Year") + ylab("PM2.5 Emissions (tons)") + ggtitle ("Baltimore PM2.5 Emissions by Year and Type") +       scale_fill_brewer(palette = "Dark2") + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1)   
      print(g)
      dev.off()
