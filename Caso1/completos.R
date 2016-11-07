completos <- function(directorio = "C:\\Users\\Jhon\\Documents\\GitHub\\Programacion_Actuarial_lll_OT16\\specdata", id = 1:332){
    setwd(directorio)
    NumArch <- paste(directorio,"/",sprintf("%03d",id),".csv", sep = "")
    ComCass<-c()
    for (i in 1:length(id)) {
        ArchAct <- read.csv(NumArch[i], header = TRUE)
        ComCass<-c(ComCass,length(ArchAct[!is.na(ArchAct[2]),2]))
    }
    print(data.frame(id, ComCass))
}

completos(directorio = "C:\\Users\\Jhon\\Documents\\GitHub\\Programacion_Actuarial_lll_OT16\\specdata", id = 1:332)
