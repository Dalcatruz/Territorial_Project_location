

library(dplyr)
library(sf)
library(ggplot2)

#### Lectura y Unión de Localidades de Chile
####


zonaurbana_r01 <- st_read("input/R01/ZONA_C17.shp")

zonaurbana_r02<- st_read("input/R02/ZONA_C17.shp")

zonaurbana_r03 <- st_read("input/R03/ZONA_C17.shp")

zonaurbana_r04<- st_read("input/R04/ZONA_C17.shp")

zonaurbana_r05 <- st_read("input/R05/ZONA_C17.shp")

zonaurbana_r06<- st_read("input/R06/ZONA_C17.shp")

zonaurbana_r07 <- st_read("input/R07/ZONA_C17.shp")

zonaurbana_r08<- st_read("input/R08/ZONA_C17.shp")

zonaurbana_r09 <- st_read("input/R09/ZONA_C17.shp")

zonaurbana_r10<- st_read("input/R10/ZONA_C17.shp")

zonaurbana_r11 <- st_read("input/R11/ZONA_C17.shp")

zonaurbana_r12<- st_read("input/R12/ZONA_C17.shp")

zonaurbana_r13 <- st_read("input/R13/ZONA_C17.shp")

zonaurbana_r14<- st_read("input/R14/ZONA_C17.shp")

zonaurbana_r15 <- st_read("input/R15/ZONA_C17.shp")

zonaurbana_r16<- st_read("input/R16/ZONA_C17.shp")


# unimos las localidades

dfs_zonasurbanas = sapply(.GlobalEnv, is.data.frame) 
dfs_zonasurbanas<- do.call(rbind, mget(names(dfs_zonasurbanas)[dfs_zonasurbanas]))

# define a function

st_x = function(x) st_coordinates(x)[,1]
st_y = function(y) st_coordinates(y)[,2]

# las transformaremos en coordenadas 
dfs_zonasurbanas <- dfs_zonasurbanas %>%
  st_centroid(dfs_zonasurbanas) 

dfs_zonasurbanas <- dfs_zonasurbanas %>%
  mutate(lon=st_x(dfs_zonasurbanas),
         lat=st_y(dfs_zonasurbanas))


# Ahora lo transformaremos en un df con solo las coordenadas

dfs_zonasurbanas <- dfs_zonasurbanas %>%
  
  as.data.frame() %>%
  
  select(-geometry, -SHAPE_Area, -SHAPE_Leng)


dfs_zonasurbanas <- dfs_zonasurbanas %>% 
  janitor::clean_names()


# guardamos

library(readr)

write_rds(dfs_zonasurbanas, "temp/dfs_zonasurbanas_chile.rds")

