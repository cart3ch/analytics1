#Data structures----
# The four dashes make a bookmark for easy access
#R is capable of handling larger data sets than Excel

#Vectors----
#The simplest data structure. Can store only one data type in it. 
v1<-1:100 #create a vector from 1 to 100
v2<-c(1,4,10,35,90)
class(v1) # integer is discrete, no decimal point
class(v2) #numeric is a double data type
v3<-c('a','Karthigeyan','Haren','Sushruth','Khan Singh') 
class(v3) #character vector
v4<-c(TRUE,T,F,FALSE)
class(v4) #logical vector

#Summary on vectors
mean(v1) #average
median(v1) #median middle value after sorting
sd(v1) #Standard deviation 
var(v1) # Variance
hist(women$height) #histogram is for continuous data, in bar graph there is a gap between columns
v2[v2>=5] #filtering the data from the vector
x<-rnorm(100,mean = 60,sd = 10)
x
hist(x)
plot(x)
plot(density(x)) #draw a curve fit
abline(v=60) #draw vertical line at v=

#rectangles and density lines together
hist(x,freq = F)
lines(density(x))

hist(x,breaks=20) #change no: of bins using breaks
hist(x, breaks = 20, col = 1:20) # add colour to the bin rectangles
length(x) # get the length of the vector
sd(x)
?sample
x1<-LETTERS[5:20]
x1
set.seed(1234) # fix the pattern using the 1234 as identifier for that sample. !! ALWAYS USE SET.SEED BEFORE SAMPLING !! 
y1<-sample(x1)
y1
set.seed(52)
(y2<-sample(x1,size = 5)) # parenthesis for printing variable after executing, saving a line used to print. !! NOT TO BE USED IN A PRODUCTION ENVIRONMENT ONLY LEARNING!!

gender<-sample(c('M','F'))
(gender<-sample(c('M','F'),size = 1000000,replace = T, prob = c(0.3,0.7)))
t1<-table(gender) #summarizes the count of vector
prop.table(t1) # gives proportion 
pie(t1) #generate a pie chart
barplot(t1, col=7:8, horiz = T) # generate a bar plot, col-- colour using range, horiz -- horizontal 


#Matrix----







#Arrays----
