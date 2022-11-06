


View(Enfermedades)
View(Sedentarismo)

library("dplyr")
#vamos a hacer un join entre nuestras dos tablas por comunidad autonoma

#combinacion <- inner_join(enfermedades,sedentarismo, by= "Comunidad autónoma")






iris

# library
library(ggplot2)

# create a dataset
enfermedades <- data.frame(enfermedades)
sedentarismo <-data.frame(sedentarismo)

data <- data.frame(enfermedades,sedentarismo)
View(data)

# Grouped
ggplot(data, aes(fill=data, y=sedentarismo, x=enfermedades)) + 
  geom_bar(position="dodge", stat="identity")


data
library(ggplot2)
ggplot (data, aes( x = Total, y =Total.1, colour = Enfermedades))+ geom_point()
  





