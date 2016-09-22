MediaContaminante <- function(directorio, contaminante, id = 1:332) {
  getwd()
  setwd("~/GitHub/programacion_Actuarial_lll_OT16")
  suma <- 0 
  for (i in id) {
    direc <- read.csv(paste(directorio, "/", 
                            formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    direc <- read.table(paste(directorio, "/", 
                              formatC(i, width = 3, flag = "0"), ".csv", sep = ""),T,",")
    completos <- complete.cases(direc)
    med <- mean(direc[1:nrow(direc),][completos,contaminante])
    #print(med)
    suma <- suma + med 
  } 
  suma/length(id)
}
MediaContaminante("specdata","nitrate",1:24)
MediaContaminante("specdata","sulfate",29:190)
