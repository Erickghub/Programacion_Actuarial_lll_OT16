mediacontaminante <- function(directorio ="C:\\Users\\Jhon\\Documents\\GitHub\\Programacion_Actuarial_lll_OT16\\specdata",contaminante = "sulfate",id = 1:332){
    setwd(directorio)
    NumArch <- paste(directorio,"/",sprintf("%03d",id),".csv", sep = "")
    cc<-c()
        for (i in 1:length(id)) {
            ArchAct <- read.csv(NumArch[i], header = TRUE)
            SinNa <- ArchAct[!is.na(ArchAct[, contaminante]), contaminante]
            cc <- c(cc, SinNa)
        }
    print(mean(cc))
}

mediacontaminante(directorio = "C:\\Users\\Jhon\\Documents\\GitHub\\Programacion_Actuarial_lll_OT16\\specdata", contaminante = "sulfate", id = 1)


