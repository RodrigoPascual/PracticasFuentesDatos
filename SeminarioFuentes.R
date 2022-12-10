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




#carga de tablas con las que haremos el estudio

enfermedades <- read_delim(file = "input/enfermedades_cronicas1.csv",delim = ";",show_col_types = FALSE)
sedentarismo <- read_delim(file = "input/sedentarismo.csv",delim = ";",show_col_types = FALSE)



#Cambiamos la columna de Total de str a numeric
sedentarismo<- sedentarismo%>%
  transmute(Sexo, Comunidades.y.Ciudades.Autónomas,Sí.o.no, Total = as.numeric(Total))

enfermedades<- enfermedades%>%
  transmute(Sexo, Comunidades.y.Ciudades.Autónomas, Enfermedades, Sí.o.no, Total = as.numeric(Total))

#Paso de enfermedades y sedentarismo a data frame para hacer el join
enfermedades <- data.frame(enfermedades_cronicas)
sedentarismo <-data.frame(sedentarismo)

#hacemos un full join con los data frames anteriores a partir de las columnas Sexo, Comunidades.y.Ciudades.Autónomas y Si.o.no
data <- full_join(x = enfermedades, 
            y = sedentarismo,
            by = c("Sexo", "Comunidades.y.Ciudades.Autónomas", "Sí.o.no"))

#Filtramos la tabla anterior solo por las enfermedades que vamos a estudiar
data2 <- data %>% 
  filter(Enfermedades == "Problemas de próstata (solo hombres)" | Enfermedades == "Problemas del periodo menopáusico (solo mujeres)" | Enfermedades == "Migraña o dolor de cabeza frecuente" | Enfermedades == "Ictus (embolia, infarto cerebral, hemorragia cerebral)" | Enfermedades =="Hemorroides" | Enfermedades == "Osteoporosis")


# Grouped
'ggplot(data, aes(fill=data, y=sedentarismo, x=enfermedades)) + 
  geom_bar(position="dodge", stat="identity")'


#gráfica enfermedades-sexo. Enfermos y no enfermos
ggplot (data= data, aes( x = Total.x, y =Enfermedades, colour = Sexo))+ geom_point()

#Tabla de solo las personas que padecen la enfermedad
data3 <- data2 %>% filter(Sí.o.no == "Sí")

#gráfica enfermedades-sexo. Enfermos solo
ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

#
ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)

#gráficas por comunidad, sexo y enfermedad padecida
ggplot(data = data3, aes(x = Total.x, y = Enfermedades)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(Comunidades.y.Ciudades.Autónomas~Sí.o.no)

#graficas de dispersión:

#En función del sexo
ggplot(data = data3, aes(x = Total.x, y = Total.y))+  
  geom_point(aes(colour = Sexo))+  geom_smooth(colour = "red", linewidth = 1.75)+  
  labs(x = "Enfermos", y = "Sedentarios")

#En función de la enfermedad
ggplot(data = data3, aes(x = Total.x, y = Total.y))+  
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

enfermedades_cronicas
data5 <- data.frame(enfermedades_cronicas,sedentarismo)

ggplot(data = data5, aes(x = enfermedades_cronicas, y = sedentarismo))+
  geom_point(aes(colour = "Comunidades y Ciudades Autónomas"))+
  geom_smooth(colour = "red")+
  labs(x = "Enfermedades", y = "Sendentarismo")

