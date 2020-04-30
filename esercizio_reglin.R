#exo esempio

data(cars)

##régression linéaire entre speed et dist 
linearMod=lm(dist~speed,data=cars)
sumModel=summary(linearMod)
print(sumModel$coeffic)

#affichier la droite de la régression lineaire
plot(cars$speed,cars$dist) #nouage de points
abline(linearMod,col="red") #régression linéaire coloriée en rouge

#affichage d'autres graphiques permettant d'analyse les résultats de la régression
plot(linearMod) #meme res mais il génère plusieurs graphiques 
