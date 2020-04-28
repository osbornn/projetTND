#Question 3 Partie 1

#Loading stuff
library(leaflet)
covid19 <- head(covid.19, 100)

#Colors and shit
mybins <- seq(4, 6.5, by=0.5)
mypalette <- colorBin( palette="YlOrBr", domain=covid19$deces_total, na.color="transparent", bins=mybins)

# Prepare the text for the tooltip:
mytext <- paste(
  "Décès totaux: ", covid19$deces_total, "<br/>", 
  "Réanimations totales : ", covid19$reanimation_total, "<br/>", 
  "Hospitalisés totaux : ", covid19$hospitalises_total, "<br/>",
  "Guéris totaux : ", covid19$gueris_total, sep = "") %>%
  lapply(htmltools::HTML)

#Map
m <- leaflet(covid19) %>% 
  addTiles()  %>% 
  setView( lat=-27, lng=170 , zoom=4) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~longitude, ~latitude, 
                  fillColor = ~deces_total, fillOpacity = 0.7, color="white", radius=8, stroke=FALSE,
                   label = mytext,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~deces_total, opacity=0.9, title = "Magnitude", position = "bottomright" )

m 


