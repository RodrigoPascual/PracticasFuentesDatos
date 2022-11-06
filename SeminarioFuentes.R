
library("dplyr")
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma

combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")







