rankhospital <- function(estado,resultado,num="mejor"){
#CONSEGUIR LA DIRECCION DEL ARCHIVO++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    getwd()
    setwd("~/Actuaria/TercerSemestre/Progra3")
    dirc  <- read.csv("outcome-of-care-measures.csv")
#VERIFICAR QUE NO SEA UN RESULTADO INVALIDO++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if(resultado=="ataque"){enc<- 11} else{
        if(resultado=="falla"){enc<-17} else{
            if(resultado=="neumonia"){enc<-23} else
                if(resultado !="ataque" & resultado !="falla" & resultado !="neumonia"){stop("Resultadp invalido")}
        }
    }
#CODIGO    
    if(num=="mejor"){num <-1}
        if(all(sapply(dirc$State,function(x){x!=estado}))==FALSE){
                DatFr<-data.frame(dirc$Hospital.Name,dirc$State,dirc[,enc])
                DatFr2<-subset(DatFr,DatFr$dirc.State==estado)
                TDatFr2<-nrow(DatFr2)
            for (j in 1:TDatFr2) {if(DatFr2[j,3]=="Not Available"){DatFr2[j,3]<-NA}}
                    var2<-data.frame(DatFr2$dirc.Hospital.Name,as.numeric(as.character(DatFr2[,3])))
                if(num=="peor"){
                    Cal <- as.character(rev(sort.default(subset(var2,var2[,2]==max(var2[,2],na.rm = TRUE))[,1]))[1])
                    Cal
                }else{
                    for (j in num){
                        Cal <- as.character(sort.default(subset(var2,var2[,2]==sort.default(var2[,2],na.last = TRUE)[j])[,1])[ j-nrow(subset(var2,var2[,2]<sort.default(var2[,2],na.last = TRUE)[j]))])
                    }
                Cal 
                }
        
    }else{ stop("Estado inválido")}
}
rankhospital("MD","ataque","peor")

    