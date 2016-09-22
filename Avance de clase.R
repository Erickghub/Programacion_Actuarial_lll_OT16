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


#clase del 01/09/16

getwd()
setwd("~/GitHub/Programacion_Actuarial_lll_OT16")
data <- read.csv("table.csv",stringsAsFactors = FALSE)
sapply(data,class)


#clase del 05/09/16

#uso de dput y dget 
y <- data.frame(a = 1 , b= "a")
dput(y)
dput(y,file = "y.R")
nueva.y <- dget("y.R")
y
nueva.y

x <- "Programacion actuarial III"
y <- data.frame(a = 1 , b = "a")
dump(c("x","y"), file = "data.R")
rm(x,y)
source("data.R")

#Tarea 
y <- data.frame(airquality)
dput(y)
dput(y,file = "Tarea3.R")

x <- data.frame(check.names = T,airquality)
dput(x)
dput(x,file = "Airquality.R")

#termia tarea 

con <- url("http://www.fcfm.buap.mx/","r")
x <- readLines(con , 7)
x 


#creamos un vector
x <- c("a","b","c","c","d","e")
#veamos el vector 
x 
#extraemos elementos con []
x[1]
x[2]
#tambien podemos extraer una secuencia de elementos 
x[1:4]
#Es posible exttraer elementos que cumplen una restriccion 
x[x>"b"]
#de manera equivalente se pude extraer un vector logico 
u <- x == "c"
u 
x[u]

#creamos una lista 
x <- list(foo = 1:4, bar = 0.6)
#extraemos el primer elemento de la lista 
#este elemento es una lista que contiene una secuencia 
x[1]
x$foo

#extraemos nuevamente el primer elemento de la lista 
#ahora el elemento es la secuencia en si 
x[[1]]
#extraemos un elemento or nombre 
x$bat
x[["bar"]]
x["bar"]
x$bar

#clase 07/09/16

x <- list(foo = 1:4 , bar = 0.6 , baz = " Hola ")
x [c(1,3)]
x [[c(1,3)]]

x <- matrix(1:6,2,3)
x
x [1,2]
x[2,1]
x[1,]
x[,2]
x[1, , drop = FALSE]


x <- list(aardvark = 1:5)
x$a #porque empieza con, solo se usa con las que empieza 
x[["a"]]
x [["a",exact = F]]

#vamos a hacer un mecanismo para trabajar con valores faltantes 
    airquality[1:6,]
completos <- complete.cases(airquality)
completos 

airquality[completos,][1:6,]
airquality[1:6,][completos,]

x <- 1:4; y <- 6:9
x+y 
x > 2
x >= 2
y == 8 #el igual igual es para evaluar como logico 


x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x * y #asi se multiplica entrada (i,j) por entrada (i,j) "la no normal"
x / y 
x %*% y #asi se multiplican matrices como normalmente 

#esructuras de control 
if(x>3) {
  y <- 10 
} else {
  y <- 0 
}
for (i  in 1:10) {
   print(i)
} #imprime en lla consola los numeros del 1 al 10 vector por vector 

x <- c("a","b","c","d")
for (i in 1:4){
  print(x{1})
}
  
for (i in seq_along(x)) {
    print(x[i])
}

m <- matrix(1:6,2,3)
m 
  
for (i in seq_len(nrow(m))) {
    for (j  in seq_len(ncol(m))) {
        print(m[i,j])
    }
}
  
#clase del 12/09/16

#ciclo while 

















































  


dos <- 0 
once <- 0
for (i in 1:100) {
  

z <- 5
caminata <- vector("numeric")
while (z>=3 && z<=10) {
  print(z)
  caminata <- c(caminata,z)
  moneda <- rbinom(1,1,0.5)
  if(moneda==1){#caminata aleatoria
    z <- z+1
    } else {
    z <- z-1
  }
}
z
if(z==2) {
  dos <- dos +1
} else {
  once <- once +1
}
}
dos 
once 



#clase 19-9-16
 #creacion de funciones
suma2 <- function(x,y){
  x+y
}
suma2(1,2)

mayor10 <- function(x){
  x[x>10]
}

mayor10(runif(10000,5,15))


mayorque <- function(x,n){
  x[x>n]
}

PromedoCol <- function(x, quitar.NA = TRUE){
  NumCol <- ncol(x)
  medias <- vector("numeric", NumCol)
  
  for (i in 1:NumCol) {
    medias[i] <- mean(x[,i],na.rm = quitar.NA)
  }
}

PromedoCol(as.matrix(c(1,2,3,NA)))

#evaluacion perezosa 
f <- function(a,b){
  a^2
}

f(2)
f(2,1)
f(2,NA)
f(2,"NA")

myplot <- function(x,y,type = "l", ...){
  plot(x,y, type = type, ...)
}

paste("a","b", sep = ":")
paste("a","b",se = ":")





