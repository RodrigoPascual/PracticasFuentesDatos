# libraries
library(readr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(forcats)
library(hrbrthemes)
library(viridis)
library(rjson)
library(XML)
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma
#https://thomasadventure.blog/es/posts/r-fusionando-tablas-datos/


#carga de tablas con las que haremos el estudio

#Datos importados por CSV

enfermedades <- read_delim(file = "input/enfermedades_cronicas1.csv",delim = ";",show_col_types = FALSE)
sedentarismo <- read_delim(file = "input/sedentarismo.csv",delim = ";",show_col_types = FALSE)


##Datos importados por JSON
enfermedades_json <- fromJSON(file = "input/enfermedades_cronicas1.json")
sedentarismo_json <- fromJSON(file = "input/sedentarismo.json")


##Datos importados por XML
enfermedades_xml <- xmlParse(file="input/enfermedades_cronicas1.xml")
sedentarismo_xml <- xmlParse(file="input/sedentarismo.xml")


##
#sedentarismo <- read_delim(file = "input/",delim = ";",show_col_types = FALSE)

#Paso de enfermedades y sedentarismo a data frame para hacer el join
enfermedades <- data.frame(enfermedades)
sedentarismo <-data.frame(sedentarismo)

#Cambiamos la columna de Total de str a numeric
#sedentarismo<- sedentarismo%>%
#  transmute(Sexo, Comunidades.y.Ciudades.Autónomas,Sí.o.no, Total = as.numeric(Total))

#enfermedades<- enfermedades%>%
#  transmute(Sexo, Comunidades.y.Ciudades.Autónomas, Enfermedades, Sí.o.no, Total = as.numeric(Total))

#hacemos un full join con los data frames anteriores a partir de las columnas Sexo, Comunidades.y.Ciudades.Autónomas y Si.o.no
data <- full_join(x = enfermedades, 
            y = sedentarismo,
            by = c("Sexo", "Comunidades.y.Ciudades.Autónomas", "Sí.o.no"))

#Filtramos la tabla anterior solo por las enfermedades que vamos a estudiar
data_menosEnfermedades <- data %>% 
  filter(Enfermedades == "Tensión alta" | Enfermedades == "Varices en las piernas" | Enfermedades == "Migraña o dolor de cabeza frecuente" | Enfermedades == "Ictus (embolia, infarto cerebral, hemorragia cerebral)" | Enfermedades =="Hemorroides" | Enfermedades == "Osteoporosis")

#Tabla de solo las personas que padecen la enfermedad
data_soloSi <- data_menosEnfermedades %>% filter(Sí.o.no == "Sí")

#-----------------------------------

#gráfica enfermedades-sexo. Enfermos y no enfermos
ggplot (data= data, aes( x = Total.x, y =Enfermedades, colour = Sexo))+ geom_point()

#gráfica enfermedades-sexo. Enfermos solo
ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)

#------------------------------------

#gráficas por comunidad, sexo y enfermedad padecida
#Indica en cada comunidad autónoma que enfermedad es mas padecida según cada sexo
ggplot(data = data_soloSi, aes(x = Total.x, y = Enfermedades)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(~ Comunidades.y.Ciudades.Autónomas)

#Filtramos la tabla para que no salga al representar la gráfica el total
data_sedentarismo <- data_menosEnfermedades %>% filter(Sí.o.no == "Sí" | Sí.o.no == "No")

#gráficas por comunidad, sexo y sedentarismo
#Indica en cada comunidad autónoma que sexo es más sedentario ademas de que comunidad autonoma es mas sedentaria en general
ggplot(data = data_sedentarismo, aes(x = Total.y, y = Sí.o.no)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(~ Comunidades.y.Ciudades.Autónomas)


#grafica de dispersión:

#Sedentarismo en funcion de la enfermedad
ggplot(data = data_soloSi, aes(x = Total.x, y = Total.y))+  
  geom_point(aes(colour = Enfermedades))+  geom_smooth(colour = "red", linewidth = 1.75)+  
  labs(x = "Enfermos", y = "Sedentarios")



# Load the library
#library(leaflet)

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
data5 <- data.frame(enfermedades,sedentarismo)

ggplot(data = data5, aes(x = enfermedades, y = sedentarismo))+
  geom_point(aes(colour = "Comunidades y Ciudades Autónomas"))+
  geom_smooth(colour = "red")+
  labs(x = "Enfermedades", y = "Sendentarismo")

