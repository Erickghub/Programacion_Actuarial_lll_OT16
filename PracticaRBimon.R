#Lectura de datos
getwd()
setwd("~/GitHub/Programacion_Actuarial_lll_OT16")
data <- read.csv("table.csv")
data <- read.table("table.csv",T,",")
data



getwd()
setwd("~/GitHub/programacion_Actuarial_lll_OT16/specdata")
direc <- read.csv("001.csv")
direc <- read.table("001.csv",T,",",nrows = 1462)
direc

