# libraries
library(readr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(forcats)
library(hrbrthemes)
library(viridis)
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma
#https://thomasadventure.blog/es/posts/r-fusionando-tablas-datos/


#combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")



enfermedades_cronicas <- read_delim(file = "input/enfermedades_cronicas1.csv",delim = ";",show_col_types = FALSE)
sedentarismocsv <- read_delim(file = "input/sedentarismo.csv",delim = ";",show_col_types = FALSE)




enfermedades_cronicas

<<<<<<< HEAD
#
innerunion <- inner_join(enfermedades,sedentarismo)
#
unionIzquierda <- left_join(enfermedades,sedentarismo, by = "Sexo")
#
unionDerecha <- right_join(enfermedades,sedentarismo)
=======
#En la unión interna, sólo los registros de Izquierda y Derecha que tengan una clave igual aparecerán en la tabla final.
innerunion <- inner_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")

#
unionIzquierda <- left_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")

#
unionDerecha <- right_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")

>>>>>>> 5dd5ea940cf2ca31a5668ae41ae2455bb9fe4c59
#
unionTotal <- full_join(enfermedades,sedentarismo)

sedentarismo <-data.frame(sedentarismo)
str(sedentarismo)
sedentarismo<- sedentarismo%>%
  transmute(Sexo, Comunidades.y.Ciudades.Autónomas,Sí.o.no, Total = as.numeric(Total))

enfermedades <- data.frame(enfermedades_cronicas)
str(enfermedades)
enfermedades<- enfermedades%>%
  transmute(Sexo, Comunidades.y.Ciudades.Autónomas, Enfermedades, Sí.o.no, Total = as.numeric(Total))

# create a dataset
enfermedades <- data.frame(enfermedades_cronicas)
sedentarismo <-data.frame(sedentarismo)

data <- data.frame(enfermedades,sedentarismo)
View(data) 

# Grouped
'ggplot(data, aes(fill=data, y=sedentarismo, x=enfermedades)) + 
  geom_bar(position="dodge", stat="identity")'


#gráfica enfermedades-sexo. Enfermos y no enfermos
ggplot (data= data, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

#Tabla de solo las personas que padecen la enfermedad
data2 <- data %>% filter(Sí.o.no.1 == "Sí")

#gráfica enfermedades-sexo. Enfermos solo
ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

#
ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)

#gráficas por comunidad, sexo y enfermedad padecida
ggplot(data = data2, aes(x = Total, y = Enfermedades)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(Comunidad.autónoma~Sí.o.no)



levels(factor(data2$Enfermedades))
data3 <- data2 %>% 
  filter(Enfermedades == "Problemas de próstata (solo hombres)" | Enfermedades == "Problemas del periodo menopáusico (solo mujeres)" | Enfermedades == "Migraña o dolor de cabeza frecuente" | Enfermedades == "Ictus (embolia, infarto cerebral, hemorragia cerebral)" | Enfermedades =="Hemorroides" | Enfermedades == "Osteoporosis")

data3

datos_bien <- data3 %>%
  across(c(Comunidades.y.Ciudades.Autonomas= comunidades.autonomas, Enfermedades, Total = total.enfermos, Total.1 = total.sedentarios, ))

ggplot(data = data3, aes(x = Total, y = Enfermedades)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(Comunidades.y.Ciudades.Autónomas~Sí.o.no)


ggplot(data = data3, aes(x = Total, y = Total.1))+  
  geom_point(aes(colour = Comunidades.y.Ciudades.Autónomas))+  geom_smooth(colour = "red", linewidth = 1.75)+  
  labs(x = "Enfermos", y = "Sedentarios")

ggplot(data = data3, aes(x = Total.1, y = Total))+  
  geom_point(aes(colour = Enfermedades))+  geom_smooth(colour = "red", linewidth = 1.75)+  
  labs(x = "Enfermos", y = "Sedentarios")

# Load the library
library(leaflet)

# Note: if you do not already installed it, install it with:
# install.packages("leaflet")

# Initialize the leaflet map with the leaflet() function
m <- leaflet()
# Then we Add default OpenStreetMap map tiles
m <- addTiles(m)
m

# Same stuff but using the %>% operator
m <- leaflet() %>% 
  addTiles()
m
