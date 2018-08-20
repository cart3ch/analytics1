#Data structures----
# The four dashes make a bookmark for easy access
#R is capable of handling larger data sets than Excel

#Vectors----
#The simplest data structure. Can store only one data type in it. The moment there's a character in the vector , everything gets converted to character 
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
#Has 2 dimensions but store only one data type
(m1<-matrix(1:24,nrow = 4)) # by default data gets filled columnwise
(m1<-matrix(1:24,nrow = 4, byrow = T))
(m1<-matrix(1:24,ncol = 4, byrow = T))
set.seed(6060100)
(x=trunc(runif(60,min = 60,max = 100)))
#round #truncate #ceiling #floor
plot(density(x))
(m4=matrix(x,ncol = 6))
#sum and means for columns and rows
colSums(m4)
rowSums(m4)
colMeans(m4)
rowMeans(m4)
m4[m4>67&m4<86]
#numerical b4 comma row, after comma column
m4[8:10,c(1,3,5)] #filtering matrix by sequence and non-sequence. NOTE the position starts from 1
rowSums(m4[8:10,c(1,3,5)])


#Arrays----


#DataFrame----
#Very important, structure resembles a excel type. Each column has different data type
#rollno, name, gender, course, marks1, marks2
(rollno<-1:60)
(name<-paste('student1',1:60,sep='-'))
(gender<-sample(c('M','F'),size = 60,replace = T, prob = c(0.3,0.7)))
(course<-sample(c('BBA','FPM','MBA'),size = 60, replace = T, prob = c(0.3,0.3,0.4)))
(marks1<-ceiling(rnorm(60,mean = 60,sd = 11)))
(marks2<-floor(rnorm(60,mean = 65,sd=7)))
(grades<-sample(c('A','B','C'),size = 60, replace = T))
(students<-data.frame(Rollno=rollno,Gender=gender,Course=course,Marks1=marks1, Marks2=marks2, Grades=grades, row.names = name, stringsAsFactors = F))
summary(students)
students[students$Gender=='M',c("Rollno","Gender","Marks1")] #filtering condition
barplot(table(students$Course),ylim = c(0,60), col = 3:6) # for pie,barplots you should use table() command, ylim gets you y axis limit
text(1:3,table(students$Course)+5, table(students$Course)) # you can add labels using the text() and specify y as length of column +5 
str(students) #gives the structure of the data
nrow(students)
names(students)
dim(students)
head(students)
tail(students)
head(students,n=7)
students[1,"Gender"]<-'F'
head(students)
#Average marks scored by each gender in Marks1
#Gender, Marks1
aggregate(students$Marks1, by=list(students$Gender),FUN=mean) # in aggregate you can use only one function
aggregate(students$Marks2, by=list(students$Course),FUN=max)
aggregate(students$Marks2, by=list(students$Course, students$Grades),FUN=max)

#dplyr
library(dplyr)
students %>% group_by(Gender) %>% summarise(mean(Marks1)) #using the %>% piping operator
students %>% group_by(Gender,Course) %>% summarise(meanmarks1=mean(Marks1),min(Marks2)) %>% arrange(desc(meanmarks1))#piping is simpler than aggregate command

students %>% arrange(desc(Marks1)) %>% filter(Gender=='M') %>% head()

students%>% sample_frac(size = 0.1,replace = F)
students%>% sample_n(10) %>% arrange(Course)
students%>% mutate(Total=Marks1+Marks2)
students%>% group_by(Course,Gender)%>%arrange(Marks1)%>% top_n(n=1)
#Factor
students$Gender<-factor(students$Gender)
summary(students$Gender)
(students$Course<-factor(students$Course,ordered=T))
(students$Course<-factor(students$Course,ordered=T,levels = c('FPM','MBA','BBA')))
summary(students$Grades)
(students$Grades<-factor(students$Grades,ordered = T, levels = c('C','A','B'))) # median can be found for ordinal data but you don't have mean
table(students$Grades)
barplot(table(students$Grades))
barplot(summary(students$Grades))
students

#exporting object as csv
write.csv(students,'./data/iimtrichy.csv')
students2<-read.csv('./data/iimtrichy.csv')
head(students2) #get an extra column of row names
students2<-students2[,-1] #remove the extra column of row names
head(students2)
student3<- read.csv(file.choose()) #launch file chooser GUI

#Extra commands
name[1:10]
name[-c(1:10)] # omitting certain values using minus sign
name[-c(1:10,15:20)]
rev(name) # reverse using rev()
name[60:1] # reverse using position values
