#This Script Creates a Heatmap of Seattle Drug Overdoes
#to be used in a project about the implemetnation of a Safe Injection Site in King County
# author : @kylegoodwin

#Used tutorial from http://www.geo.ut.ee/aasa/LOOM02331/heatmap_in_R.html

#setwd('/Users/kylegoodwin/health/SafeInjection')
#devtools::install_github("dkahle/ggmap")
#devtools::install_github("hadley/ggplot2")
require(dplyr)
require(ggplot2)
require(ggmap)


data <- read.csv('data/spd-overdose-deaths.csv',stringsAsFactors = FALSE)
date.data <- read.csv('data/spd-updated-data.csv',stringsAsFactors = FALSE)
  
allMaps <- function(loc, zoom,sz,a){
  
  base.map <- get_map(location = loc, zoom = zoom)
  final.map <- ggmap(base.map, extent = "device") + 
    geom_point(aes(x = Longitude, y = Latitude), colour = "red", 
      alpha = a, size = sz, data = data)
  
return(final.map)
}

northSeattleMap <- function(){
  nmap <- allMaps('green lake',13,3,.3)
  return(nmap)
}

allSeattleMap <- function(){
  amap <- allMaps('seattle',12,2,.3)
  return(amap)
}

downtownMap <- function(){
  dmap <- allMaps('westlake park',14,2,.16)
  return(dmap)
}
  

                                                     