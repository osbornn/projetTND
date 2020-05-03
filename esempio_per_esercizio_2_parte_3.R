#tutorial
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
mtcars$cyl <- as.factor(mtcars$cyl)
head(ToothGrowth)
View(mtcars)
View(ToothGrowth)

head(mtcars)

#  colorati
library(ggplot2)
# Box plot
bp<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) +
  geom_boxplot()
bp
# Nuage de points
sp<-ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point()
sp

sp= ggplot(deces_total, aes(x=wt, y=mpg, color=cyl)) + geom_point()
sp
