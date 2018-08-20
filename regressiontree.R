#CART classification and regression trees using ginindex, entropy, reduction in variance
    #Category => classification tree
    #Numerical=> Regression tree
#ctrees using pvalues 2-way split
#CHAID multi way split; IV,DV are categories

#install.packages('rpart',dependencies=T)
#install.packages('rpart.plot',dependencies=T)
#install.packages('ISLR',dependencies=T)


# Decision Trees : 

library(ISLR) 
data(Carseats)
head(Carseats)
names(Carseats)
?Carseats
data = Carseats

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)

#Model
decisiontree = rpart(Sales ~ . , data=data, method='anova' ) # '.' is a short method of considering all the other variables
decisiontree
rpart.plot(decisiontree,cex=0.8)

#this is large tree, so prune it: check cp = complexity parameter
printcp(decisiontree) #value of cp such that xerror is minimum (cross validation error)
prunetree = prune(decisiontree, cp=0.05) #higher the cp value the lesser the splittings in the tree
prunetree #understanding prune tree : 
rpart.plot(prunetree, nn=T) #node number

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)
library(dplyr)
(testdata= sample_n(data,2))

#predict(prunetree,ndata=testdata,type = 'vector')
#?predict

#https://www.datacamp.com/community/tutorials/decision-trees-R