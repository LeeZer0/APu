

install.packages("C50")
install.packages("MASS")
library("C50")
library("MASS")

data(cats)

drzewo <- C5.0(x=cats[,-1], y=cats$Sex)

summary(drzewo)
drzewo
plot(drzewo)