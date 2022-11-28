# libraries
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



enfermedades_cronicas <- read_delim(file = "input/enfermedades_cronicas.csv",delim = ";",show_col_types = FALSE)
sedentarismo <- read_delim(file = "input/sedentarismo.csv",delim = ";",show_col_types = FALSE)




enfermedades_cronicas

#
innerunion <- inner_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")
#
unionIzquierda <- left_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")
#
unionDerecha <- right_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")
#
unionTotal <- full_join(enfermedades_cronicas,sedentarismo, by= "Comunidades y Ciudades Autónomas")





# create a dataset
enfermedades <- data.frame(enfermedades_cronicas)
sedentarismo <-data.frame(sedentarismo)

data <- data.frame(enfermedades_cronicas,sedentarismo)
View(data) 


data
library(ggplot2)

# Grouped
'ggplot(data, aes(fill=data, y=sedentarismo, x=enfermedades)) + 
  geom_bar(position="dodge", stat="identity")'


#gráfica enfermedades-sexo. Enfermos y no enfermos

ggplot (data, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

#Tabla de solo las personas que padecen la enfermedad
data2 <- data %>% filter(Sí.o.no.1 == "Sí")

data2
#view(data2)
library(ggplot2)

library(dplyr)
#ggplot (data= data2, aes( x = Total, y =enfermedades_cronicas, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas.1)


#gráfica enfermedades-sexo. Enfermos solo
ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()

#
ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)

#gráficas por comunidad, sexo y enfermedad padecida
ggplot(data = data2, aes(x = Total, y = Enfermedades)) +
  geom_point(aes(colour = factor(Sexo))) +
  facet_wrap(Comunidad.autónoma~Sí.o.no)








# creating a data frame
df2 <- enfermedades_cronicas 


df2$indice_sed <- sedentarismo$Total

# printing the updated data frame
print(df2)

data_grouped <- enfermedades_cronicas                                   # Duplicate data table

data_grouped                                           # Print updated data table


data2.2 <- group_by(data,Comunidades.y.Ciudades.Autónomas , .add = FALSE, .drop = group_by_drop_default(.data))
data2.2



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
