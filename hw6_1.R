library(ggplot2)
library(dplyr)
library(tidyr)
library(colorspace)
library(cowplot)

load("~/visualization/Rscripts/Slides13_Geo_Rscripts_Data/house_prices.rda")
house_prices

ggplot(house_prices, aes(factor(date),house_price_index, group = 1)) +geom_line()+
facet_wrap(~state)+
  scale_x_discrete(breaks =c("1980","2000","2020"),labels=c("'80","'00","'20"))+
  xlab("Date")

house_reshaped <-gather(house_prices, key = "measure", value ="value","house_price_index":"unemploy_perc",)

ggplot(house_reshaped, aes(x=factor(date),y=value,color= measure,group = 1)) +geom_line()+
  facet_wrap(~state)+
  scale_x_discrete(breaks =c("1980","2000","2020"),labels=c("'80","'00","'20"))+
  xlab("Date")

#I dont think it is a good graph to display this information becasue the values are
#not the same. One is in percentage and one isnt.

rmarkdown::render("C:/Users/Akila/Documents/visualization/hw6_1.R")
