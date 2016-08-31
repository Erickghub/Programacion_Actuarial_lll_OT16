#Factores
x <- factor(c("si","no"," si","si","no","si","no"))
x
table(x)
unclass(x)
x <- factor(c("si","no"," si","si","no","si","no"),levels = c("si","no"))


x <- factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)

#valores faltantes 
x <- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)

#Data frames 
x <- data.frame(Erick = 1:4 , Lori = c(T,T,F,F))
row.names(x) <- c("Primero","segundo","tercero","cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x) <- c("Yareli","Karen")
x

#Los nombres no son exclusivos de los data frames 
x <- 1:3
names(x)  #NULL
names(x) <- c("hugo","paco","luis")
x


x <- list(a = 1:10 ,b = 100:91, c = 51:60 )
x

names(x) <- c("sec1","sec2","sec3")
x


m <- matrix(,2,2)
m
attributes(m)
dimnames(m) <- list(c(1:5),c("col1","col2"))
m

#Lectura de datos
getwd()
setwd("~/GitHub/Programacion_Actuarial_lll_OT16")
data <- read.csv("table.csv")
data <- read.table("table.csv",T,",")
data


getwd()
