#Witold Wawrzyniuk grupa 1a zestaw 7

library(ahp)
library(data.tree)
getwd()
setwd("C:/Users/Phenix/Desktop/R/lab1")

 tablety_AHP <- Load("Tablety.yml")
 
  print(tablety_AHP, filterFun = isNotLeaf)
