    ## Across the United States, how have emissions from coal combustion-related 
    ## sources changed from 1999–2008?
      
  ## Download Data
      library("data.table")
      path <- getwd()
      download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip", sep = "/"))
      unzip(zipfile = "dataFiles.zip")
      scc <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
      nei <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))
   
   ## Merge Data
    if(!exists("nei_scc")){
    nei_scc <- merge(nei, scc, by="SCC")
      }
    library(dplyr)
    scc_coal  <- grepl("coal | Coal", nei_scc$Short.Name, ignore.case=TRUE)
    coal <- nei_scc[scc_coal, ]
    coal_data <-summarise(group_by(filter(coal), year), Emissions=sum(Emissions))
    
  ## Plot 4
     library(ggplot2)
     g <- ggplot(coal_data, aes(factor(year), Emissions)) + geom_bar(stat="Identity", fill= c("skyblue", "royalblue", "blue", "navy")) + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1) + xlab("Year") + ylab("Total Emissions (tons) from Coal") + ggtitle("Total Emissions (tons) from Coal, by Year") 
      
 ## Saving Plot 4 as a .png file
      png("plot4.png", width=600, height=600)
      g <- ggplot(coal_data, aes(factor(year), Emissions)) + geom_bar(stat="Identity", fill= c("skyblue", "royalblue", "blue", "navy")) + theme_light(base_size = 11, base_family = "sans", base_line_size =1, base_rect_size = 1) + xlab("Year") + ylab("Total Emissions (tons) from Coal") + ggtitle("Total Emissions (tons) from Coal, by Year") 
      print(g)
      dev.off()
       
      
     
     
print(g)
dev.off()
