#Question 3 Partie 1

#Loading stuff
library(leaflet)

#Colors and shit
mybins = seq(min(covid.19$deces_total), max(covid.19$deces_total), by=2000)
mypalette = colorBin( palette = "YlOrRd", domain=covid.19$deces_total, na.color="transparent", bins=mybins)

# Prepare the text for the tooltip:
mytext <- paste(
  "Deces totaux: ", covid.19$deces_total, "<br/>", 
  "Reanimations totales : ", covid.19$reanimation_total, "<br/>", 
  "Hospitalises totaux : ", covid.19$hospitalises_total, "<br/>",
  "Gueris totaux : ", covid.19$gueris_total, sep = "") %>%
  lapply(htmltools::HTML)

#Map
m = leaflet(covid.19) %>% 
  addTiles()  %>% 
  setView( lat=48, lng=2 , zoom=5) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~longitude, ~latitude, 
                  fillColor = ~mypalette(covid.19$deces_total), fillOpacity = 0.7, color="white", radius=8, stroke=FALSE,
                   label = mytext,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~deces_total, opacity=0.9, title = "Nombre de morts", position = "bottomright" )

m 


