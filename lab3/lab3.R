install.packages("neuralnet")
library("neuralnet")

nor <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

arg <-as.data.frame(runif(100, min = 1, max = 100))
wynik_f <- arg^3-2*arg

arg
wynik_f

skal.arg <- as.data.frame(lapply(arg, nor))
skal.arg

dane_t <- cbind(skal.arg, wynik_f)
colnames(dane_t) <- c("arg", "wynik_f")

net.price <- neuralnet(wynik_f~arg, dane_t, hidden = c(1, 100), threshold = 0.01)

plot(net.price)




setwd("G:/APU/APu/lab3")
tablety <- read.csv("Tablety.csv")

cena <- normalize(tablety$cena)

cena
tablety
tablety <- tablety[,-7]
tablety
tablety <- tablety[,-4]
tablety
tablety <- tablety[,-3]
tablety
tablety <- tablety[,-1]
tablety

tablety[,4:7] <- as.data.frame(lapply(tablety[,4:7], normalize))

tablety <- cbind(tablety, cena)
tablety

net.price2 <- neuralnet(cena~pamiec_wbudowana+pamiec_RAM+liczba_opini+ocena,
                       tablety, hidden = c(5,3,3), threshold = 0.01)

plot(net.price2)
