#Prior con valore fisso
mu = 3.5e-9
ricomb = 8.4e-9
Nanc = 7000000

###################################################################################
#Vedi discussione sugli appunti per come ho deciso per questa forma per T_split:
T_split = rnorm(1, 8000, 4000)
#Questa sopra era una prima prova di valori; verifichiamo plottando che sia quello che vogliamo:
#define population mean and standard deviation
population_mean <- 8000
population_sd <- 2500

#define upper and lower bound
lower_bound <- population_mean - population_sd
upper_bound <- population_mean + population_sd

#Create a sequence of 1000 x values based on population mean and standard deviation
x <- seq(-4, 4, length = 10000) * population_sd + population_mean

#create a vector of values that shows the height of the probability distribution
#for each value in x
y <- dnorm(x, population_mean, population_sd)

#plot normal distribution with customized x-axis labels
plot(x,y, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
sd_axis_bounds = 5
axis_bounds <- seq(-sd_axis_bounds * population_sd + population_mean,
                   sd_axis_bounds * population_sd + population_mean,
                   by = population_sd)
axis(side = 1, at = axis_bounds, pos = 0)

#Provando vari valori la mia decisione è stata:
#T_split = rnorm(1, 8000, 2500)
#Poi eventualmente fare un arrotondamento per avere solo valori interi:
T_split = round(rnorm(1, 8000, 2500))

###########################################################################################

#Voglio una ditribuzione uniforme tra 50k e 200k; ma siccome runif è continua, per avere valori discreti uso sample:
#N1 = runif(1, 50000,200000)
N1=sample(50000:200000,1)
N2=round(N1/3)

#Idem per mig
mig=sample(c(0, 0.1),1)

