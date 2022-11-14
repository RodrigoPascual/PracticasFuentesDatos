
View(Enfermedades)
View(Sedentarismo)

library("dplyr")
library("tidyverse")
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma
#https://thomasadventure.blog/es/posts/r-fusionando-tablas-datos/


#combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")



enfermedades_cronicas <- read_delim(file = "input/enfermedades_cronicas.csv",delim = ";",show_col_types = FALSE)
sedentarismo <- read_delim(file = "input/sedentarismo.csv",delim = ";",show_col_types = FALSE)






#
innerunion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionIzquierda <- left_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionDerecha <- right_join(enfermedades,sedentarismo, by= "Comunidad autónoma")
#
unionTotal <- full_join(enfermedades,sedentarismo, by= "Comunidad autónoma")



iris

# library
library(ggplot2)
library(dplyr)
# create a dataset
enfermedades <- data.frame(enfermedades)
sedentarismo <-data.frame(sedentarismo)

data <- data.frame(enfermedades,sedentarismo)
View(data) 

# Grouped
'ggplot(data, aes(fill=data, y=sedentarismo, x=enfermedades)) + 
  geom_bar(position="dodge", stat="identity")'


data
library(ggplot2)
ggplot (data, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()


library(dplyr)
data
data2 <- data %>% filter(Sí.o.no.1 == "Sí")
data2
#view(data2)
library(ggplot2)

library(dplyr)
ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)




ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()



library(dplyr)
library(forcats)
library(hrbrthemes)
library(viridis)






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
