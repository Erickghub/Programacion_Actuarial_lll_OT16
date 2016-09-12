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
