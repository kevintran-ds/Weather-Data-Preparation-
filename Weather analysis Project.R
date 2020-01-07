Chicago <- read.csv(file.choose(), row.names=1)
Chicago
NewYork<- read.csv(file.choose(), row.names=1)
Houston <- read.csv(file.choose(), row.names=1)
SanFrancisco <- read.csv(file.choose(), row.names=1)
NewYork
SanFrancisco
is.data.frame(Chicago)
#lets convert to matrices:
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)
#Put all of these into a list:
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather
#using apply
mean(Chicago["DaysWithPrecip",])
apply(Chicago,1,mean)
apply(Chicago,2,mean)
#compare:
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)
#recreating the apply function with loops:
output <- NULL #preparing an empty vector
for(i in 1:5){
  output[i]<- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)
output
#using the apply function instead, much simpler
apply(Chicago,1,mean)
#Using lapply()
t(Chicago)
lapply(Weather,t) #list(t(chicago),t(NewYork),....)
#example2
lapply(Weather,rbind,NewRow=1:12)
#example 3
lapply(Weather,rowMeans)
lapply(Weather,"[",1,1)
lapply(Weather,"[",1,)
#adding own functions
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])
lapply(Weather, function(x) x[1,]-x[2,])
#using sapply, avghigh_f for July:
sapply(Weather,"[",1,7)
#nesting apply functions:
lapply(Weather,apply,1,max)
sapply(Weather,apply,1,max)
#which.max() and which.min():
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#apply to iterate over rows of matrix and sapply to iterate over components of the list
apply(Chicago,1,function(x) names(which.max(x)))
lapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))
sapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))
