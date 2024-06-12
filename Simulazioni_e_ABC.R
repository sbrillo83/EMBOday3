#Simulazioni e ABC
#Per fare le simulazioni si usa lo script python
library(abc)
setwd("/home/dave/EMBOday3/")
simulated<-read.csv("mosquito-task2.csv", head=T)
parameters<-simulated[,1:4]
simulated_summ_stat<-simulated[,5:12]
mosquito_data<-read.csv("mosquito_data.csv", head=T)
mosquito_data<-mosquito_data[1,1:3]
simulated_summ_stat<-simulated_summ_stat[,1:3]

#Se ti rompe le palle dicendo che non hanno lo stesso numero di variabili è perchè devi togliere la seconda riga nel file
#mosquito_data
res1<-abc(target=mosquito_data, param=parameters, sumstat=simulated_summ_stat, method="rejection", tol=0.05, scale = T)

hist(res1$dist)
str(res1)

#Proviamo a cambiare il livello di tolleranza e vedere quanti risultati ci tiene e se cambia qualcosa
res2<-abc(target=mosquito_data, param=parameters, sumstat=simulated_summ_stat, method="rejection", tol=0.0001, scale = T)
hist(res2$dist)
str(res2)

#Vediamo quanti punti cadono nella regione di tolleranza nei due casi:
sum(res1$region)
sum(res2$region)
#Sono 157 e 1, rispettivamente

#Come fare un istogramma dei soli valori che sono stati tenuti perchè entro la regione di tolleranza?
#Farsi dare lo script di questo esercizio da Andrej.

