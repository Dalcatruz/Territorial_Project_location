
library(readr)

# Read data

dfs_localidades_chile <- read_rds("temp/dfs_localidades_chile.rds")
dfs_zonasurbanas <- read_rds("temp/dfs_zonasurbanas.rds")

# Equiparar variables

dfs_localidades_chile <- dfs_localidades_chile %>%
  select(nom_locali, geocodigo,nom_comuna, nom_region, nom_provin,region,distrito, lon, lat)
dfs_zonasurbanas <- dfs_zonasurbanas %>%
  select(urbano, geocodigo,, nom_comuna, nom_region, nom_provin, region, distrito, lon, lat)


# Creación variable distinción y renames

dfs_localidades_chile <- dfs_localidades_chile %>%
  mutate(tipo="localidad") %>%
  rename(nombre=nom_locali)
dfs_zonasurbanas <- dfs_zonasurbanas %>%
  mutate(tipo="zona urbana") %>%
  rename(nombre=urbano)


# union de datos
dfs_localidades_zonasurbanas_chile <- rbind(dfs_localidades_chile, dfs_zonasurbanas)


# lo guardamos

write_rds(dfs_localidades_zonasurbanas_chile, "output/df_localidad_y_zonas_chile.rds")

