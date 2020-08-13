


#### Mapa

# Leaflet Chart Formatting --------------------------------------------------------

palette <- colorFactor(palette = rainbow(length(unique(dfs_localidades_zonasurbanas_chile$tipo))), domain = dfs_localidades_zonasurbanas_chile$tipo)

library(leaflet)

leaflet() %>% 
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(data = dfs_localidades_zonasurbanas_chile, lng = ~lon, lat = ~lat,
                   fillOpacity = 0.6, radius = 8, fillColor = ~palette(tipo), weight = 1,
                   opacity = 0.5, popup = dfs_localidades_zonasurbanas_chile$tipo)
