library(tidyverse)
library(ggplot2)
library(Cairo)

heightweight<- read_csv("C:\Users\qul12\Documents\Claire\PGSS\CS Lab\Week 2\hwsurveydata.csv")
heightweight<-na.omit(heightweight)
heightweightsex<- read_csv("Claire/PGSS/CS Lab/Week 2/hwssurveydata.csv")
heightweightsex<-na.omit(heightweightsex)

fit0 <-lm(Weight ~.,data=heightweight)
fit1 <-lm(Weight ~.,data=heightweightsex) #tilda followed by dot does weight against everything else
summary(fit1)

plot(heightweight$Height,heightweight$Weight,xlab="Height", ylab="Weight",
     main = "Regression of Wegith on Height")
abline(fit1,col="red")

boxplot(Weight ~ Gender, main="Weight by Gender", data=heightweightsex)
