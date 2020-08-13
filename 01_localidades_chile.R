

library(dplyr)
library(sf)
library(ggplot2)

#### Lectura y Unión de Localidades de Chile
####


localidad_r01 <- st_read("input/R01/LOCALIDAD_C17.shp")

localidad_r02<- st_read("input/R02/LOCALIDAD_C17.shp")

localidad_r03 <- st_read("input/R03/LOCALIDAD_C17.shp")

localidad_r04<- st_read("input/R04/LOCALIDAD_C17.shp")

localidad_r05 <- st_read("input/R05/LOCALIDAD_C17.shp")

localidad_r06<- st_read("input/R06/LOCALIDAD_C17.shp")

localidad_r07 <- st_read("input/R07/LOCALIDAD_C17.shp")

localidad_r08<- st_read("input/R08/LOCALIDAD_C17.shp")

localidad_r09 <- st_read("input/R09/LOCALIDAD_C17.shp")

localidad_r10<- st_read("input/R10/LOCALIDAD_C17.shp")

localidad_r11 <- st_read("input/R11/LOCALIDAD_C17.shp")

localidad_r12<- st_read("input/R12/LOCALIDAD_C17.shp")

localidad_r13 <- st_read("input/R13/LOCALIDAD_C17.shp")

localidad_r14<- st_read("input/R14/LOCALIDAD_C17.shp")

localidad_r15 <- st_read("input/R15/LOCALIDAD_C17.shp")

localidad_r16<- st_read("input/R16/LOCALIDAD_C17.shp")


# unimos las localidades

dfs_localidades = sapply(.GlobalEnv, is.data.frame) 
dfs_localidades<- do.call(rbind, mget(names(dfs_localidades)[dfs_localidades]))

# define a function

st_x = function(x) st_coordinates(x)[,1]
st_y = function(y) st_coordinates(y)[,2]

# las transformaremos en coordenadas 

dfs_localidades <- dfs_localidades %>%
  st_centroid()

dfs_localidades <- dfs_localidades %>%
  mutate(lon=st_x(dfs_localidades),
         lat=st_y(dfs_localidades))


# Ahora lo transformaremos en un df con solo las coordenadas

dfs_localidades <- dfs_localidades %>%
  
  as.data.frame() %>%
  
  select(-geometry, -SHAPE_Area, -SHAPE_Leng)


dfs_localidades <- dfs_localidades %>% 
  janitor::clean_names()


# guardamos

library(readr)

write_rds(dfs_localidades, "temp/dfs_localidades_chile.rds")

