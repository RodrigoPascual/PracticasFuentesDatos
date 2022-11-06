
library("dplyr")
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma

#
combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionIzquierda <- left_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionDerecha <- right_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionTotal <- full_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionPracial <- semi_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
antiUnion <- anti_join(enfermedades,sedentarismo, by= "Comunidad autónoma")






a <- as.numeric(enfermedades.Total)

hist(x= enfermedades$as.numeric(Total), xlab = "Fctores", ylab = "Comunidad autonoma", main="Variacion de la tabla de enfermedades")