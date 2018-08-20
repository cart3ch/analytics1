#Basic stats
#use the instructor's github under folder statistics

x<-ceiling(rnorm(10000,mean = 60, sd = 20)) #create data from normal distribution
mean(x) #average
median(x) # middle value
#there is no mode function for mode stats
table(x)
sort(table(x),decreasing = T) #one way to get the mode using table and sorting it

library(modeest)
mlv(x,method='shorth') # using another way to get the mode using in-built functions

quantile(x)
quantile(x,seq(.1,1,by = 0.1)) #decile
quantile(x,seq(.01,1,by = .01)) #percentile
barplot(quantile(x,seq(0.01,1,by = 0.01))) #fun stuff using bar plot to visualize percentiles

library(e1071) #load e1071
plot(density(x))
e1071::skewness(x)
kurtosis(x)

sd(x); var(x) #semi-colon execute two commands in one line
cov(women$height,women$weight)
cor(women$height,women$weight)

stem(x)
#Freq Table
library(fdth)
ftable1=fdt(x)
ftable1
