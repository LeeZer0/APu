#Witold Wawrzyniuk grupa 1a zestaw 7

install.packages("ahp")
library(ahp)
library(data.tree)
getwd()
setwd("G:/APU/APu/lab2")
tablety_AHP <- Load("Tablety2.yml")


 
  print(tablety_AHP, filterFun = isNotLeaf)


  Calculate(tablety_AHP)
  print(tablety_AHP, priority = function(x) x$parent$priority["Total", x$name])
  Visualize(tablety_AHP)
  Analyze(tablety_AHP)
  AnalyzeTable(tablety_AHP)