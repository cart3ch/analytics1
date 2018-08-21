# Clustering

marks1=c(4,2,6,3,6,4,7,4,9)
marks=data.frame(marks1)
length(marks1)
plot(marks)
k1=kmeans(marks1,centers=2) #one of the clustering algorithms, only runs on numerical values, rugged and works on large datasets
k1
cbind(marks,k1$cluster)
marks2=sample(1:10,size=length(marks1))
newmarks=data.frame(marks1, marks2)
newmarks
k2=kmeans(newmarks, centers = 3)
cbind(newmarks,k2$cluster)
