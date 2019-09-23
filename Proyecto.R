
datos = read.csv("DatosInforme19.csv", header=TRUE, sep=";") 


summary(datos)
nrow(datos)
ncol(datos)


library(tidyverse)
library(rpart)
library(rpart.plot)
library(caret)


entrenamiento = sample_frac(datos, .7)
prueba = setdiff(datos, entrenamiento)
arbol2 = rpart(formula = Nota.Final ~ ., data = entrenamiento)
rpart.plot(arbol2)
prediccion = predict(arbol2, newdata = prueba, type = "class")
confusionMatrix(prediccion, prueba[["Nota.Final"]])