mejor <- function(estado,resultado){
#CONSEGUIR LA DIRECCION DEL ARCHIVO++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    getwd()
    setwd("~/Actuaria/TercerSemestre/Progra3")
    dir  <- read.csv("outcome-of-care-measures.csv")
#VERIFICAR QUE NO SEA UN RESULTADO INVALIDO++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if(resultado=="ataque"){enc<- 11} else{
        if(resultado=="falla"){enc<-17} else{
            if(resultado=="neumonia"){enc<-23} else
                if(resultado !="ataque" & resultado !="falla" & resultado !="neumonia"){stop("Resultadp invalido")}
        }
    }
if(all(sapply(dir$State,function(x){x!=estado}))==FALSE){
    DatFr1<-data.frame(dir$Hospital.Name,dir$State,dir[,enc])
    DatFr2<-subset(DatFr1,DatFr1$dir.State==estado)
#DatFr2: VARIABLE QUE ES UN DATA FRAME CON LOS DATOS ORDENASDOS Y SIN ESPACIOS ENTRE COLUMNAS
    TDatFr2<- nrow(DatFr2)
#TDatFr2: NUMERO DE RENGLONES DE DatFR
    for (i in 1:TDatFr2) {if(DatFr2[i,3]=="Not Available"){DatFr2[i,3]<-NA}}
    var1<-data.frame(DatFr2$dir.Hospital.Name,DatFr2$dir.State,as.numeric(as.character(DatFr2[,3])))
    var2<- min(var1[,3],na.rm = TRUE)
    best <- as.character(sort.default(subset(var1,var1[,3]==var2)[,1])[1])
    print(best)
}else{ stop("Estado inválido")}
}
mejor("TX","falla")




