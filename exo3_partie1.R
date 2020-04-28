#Question 3 Partie 1

library(leaflet)

covid19 <- head(covid.19, 100)

# Prepare the text for the tooltip:
mytext <- paste(
  "Décès totaux: ", covid19$deces_total, "<br/>", 
  "Réanimations totales : ", covid19$reanimation_total, "<br/>", 
  "Hospitalisés totaux : ", covid19$hospitalises_total, "<br/>",
  "Guéris totaux : ", covid19$gueris_total, sep = "") %>%
  lapply(htmltools::HTML)

#Map
m <- leaflet(covid.19) %>% 
  addTiles()  %>% 
  setView( lat=-27, lng=170 , zoom=4) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~longitude, ~latitude, 
                  fillOpacity = 0.7, color="white", radius=8, stroke=FALSE,
                   label = mytext,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  #addLegend( pal=mypalette, values=~mag, opacity=0.9, title = "Magnitude", position = "bottomright" )

m 


