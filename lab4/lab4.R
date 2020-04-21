install.packages("C50")
library("C50")

setwd("G:/APU/APu/lab4")
tablety <- read.csv("Tablety.csv")

summary(tablety)

tablety$ocena <- factor(tablety$ocena)
tablety

drzewo <- C5.0.default(x=tablety[,-7], y=tablety$ocena)

summary(drzewo)
drzewo
plot(drzewo)