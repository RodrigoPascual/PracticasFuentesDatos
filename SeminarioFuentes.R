


View(Enfermedades)
View(Sedentarismo)

library("dplyr")
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma

#combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")

enfermedades_cronicas <- read_delim(file = "efermedades_cronicas.csv",delim = ";",show_col_types = FALSE)
sedentarismo <- read_delim(file = "sedentarismo.csv",delim = ";",show_col_types = FALSE)




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
ggplot (data= data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point() + facet_wrap(Comunidades.y.Ciudades.Autónomas)




ggplot (data2, aes( x = Total, y =Enfermedades, colour = Sexo))+ geom_point()










library(dplyr)
library(forcats)
library(hrbrthemes)
library(viridis)

# Load dataset from github
data

# Grouped
data %>%
  Total %>%
  Enfermedades %>%
  Sexo + 
  geom_violin(position="dodge", alpha=0.5, outlier.colour="transparent") +
  scale_fill_viridis(discrete=T, name="") +
  theme_ipsum()  +
  xlab("") +
  ylab("Tip (%)") +
  ylim(0,40)































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

# save the widget in a html file if needed.
# library(htmlwidgets)
# saveWidget(m, file=paste0( getwd(), "/HtmlWidget/backgroundMapBasic.html"))

