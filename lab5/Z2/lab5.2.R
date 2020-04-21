install.packages("mlr")
install.packages("rFerns")
install.packages("randomForestSRC")
library("mlr")
library("rFerns")
library("randomForestSRC")

setwd("G:/APU/APu/lab4")


tablety <- read.csv("Tablety.csv")

tablety$ocena <- factor(tablety$ocena)

zadanie =
  makeClassifTask(id = deparse(substitute(tablety)), tablety, "ocena",
                  weights = NULL, blocking = NULL, coordinates = NULL,
                  positive = NA_character_, fixup.data = "warn", check.data = TRUE)
próbkowanie2 = makeResampleDesc(method = "CV", iters = 2, stratify = TRUE)
ucz <- makeLearners(c("rpart", "C50","rFerns",
                                 "randomForestSRC"), type = "classif")
#"lda"

porownaj <- benchmark(learners = ucz,
                                      tasks = zadanie,
                                      resampling = próbkowanie2)
porownaj
plotBMRBoxplots(porownaj, measure = mmce,
                order.lrn = getBMRLearnerIds(porownaj))
plotBMRSummary(porownaj)
plotBMRRanksAsBarChart(porownaj, pos = "dodge",
                       order.lrn = getBMRLearnerIds(porownaj))