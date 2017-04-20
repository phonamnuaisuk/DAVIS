# Exercise 3
setwd("C:/Users/My HP/Desktop/05Teaching/CRC5VIS/_Lectures")

# create 6 2D data points
px <- c(1,1,2,5,5,6)
py <- c(2,3,2,4,6,6)
points = data.frame(px,py)
out <- kmeans(points,2)

# exercise
x <- rbind( matrix(rnorm(100,mean=1,sd=0.2)), matrix(rnorm(50,mean=2,sd=0.5) ),  matrix(rnorm(50,mean=3,sd=0.5) ))
y <- rbind( matrix(rnorm(100,mean=1,sd=0.2)), matrix(rnorm(50,mean=3,sd=0.5) ),  matrix(rnorm(50,mean=2,sd=0.5) ))
X <- cbind(x,y)
plot(X)
X.km <- kmeans(X,3)


x <- rbind( matrix(rnorm(10,mean=1,sd=0.2)), matrix(rnorm(5,mean=2,sd=0.5) ),  matrix(rnorm(5,mean=3,sd=0.5) ))
y <- rbind( matrix(rnorm(10,mean=1,sd=0.2)), matrix(rnorm(5,mean=3,sd=0.5) ),  matrix(rnorm(5,mean=2,sd=0.5) ))
X <- cbind(x,y)
hc <- hclust(dist(X))
plot(hc)

# see iris data, kmeans
iris
myiris <- iris[,-5]
kmm <- kmeans(myiris,3)
kmm

# number of k
wss <- numeric(10)
for (k in 1:10) {wss[k] <- sum(kmeans(dat1,centers=k)$withinss) }
plot(1:10,wss,type="o")

# try any different 2 variables
myiris2 <- iris[,c(1,2)]
kmm2<- kmeans(myiris2,3)
kmm2

plot(myiris2[kmm2$cluster == 1,],col="green",xlim=c(0,8),ylim=c(0,4))
par(new=TRUE)
plot(myiris2[kmm2$cluster == 2,],col="red",xlim=c(0,8),ylim=c(0,4))
par(new=TRUE)
plot(myiris2[kmm2$cluster == 3,],col="blue",xlim=c(0,8),ylim=c(0,4))

# Hierarchical clustering
d <- matrix(rnorm(100), nrow=10,ncol=10)
hc <- hclust(dist(d))
plot(hc)



# decision tree
px <- seq(0.1,1,by=0.01)
Hx = -(px*log2(px) + rev(px)*log2(rev(px)))
plot(px,Hx)

# Entropy
# play (yes/no)  --> 9/5
calEntropy <- function(v) {
  N <- sum(v); L <- length(v); result <- 0
  for (n in 1:L) {
    result <- result + (v[n]/N) * log2(v[n]/N)
  }
  return(-result)
}

calGain <- function(entclass,lstatt) {
  L <- length(lstatt); result <- 0; v <- c()
  for (n in 1:L) {
    v[n] <- sum(lstatt[[n]])
  }
  N <- sum(v)
  print(c(v,N))
  for (n in 1:L) {
    result <- result + (v[n]/N) * calEntropy(lstatt[[n]])
  }
  return(entclass - result)
}

# weather
getwd()
setwd("C:/Users/My HP/Desktop/05Teaching/CRC5VIS/_Lectures")
weather <- read.csv("dataR/weather.csv")

# using rpart
library(rpart)
library(rpart.plot)
fit <- rpart(play ~ outlook + temperature + humidity + wind, method="class", 
             data=weather, parms = list(split = "information"),
             control = rpart.control(minsplit=1))
rpart.plot(fit,type=3,extra=3)


# using ctree
library(party)
fit2 <- ctree(play ~ outlook + temperature + humidity + wind, data=weather)
plot(fit2)


# Association Rules
install.packages('arules')
install.packages('arulesViz')
library(arules)
library(arulesViz)
Groceries@itemInfo
Groceries@data
itemsets <- apriori(Groceries, parameter=list(minlen=2, maxlen=3, support=0.02, target="frequent itemsets"))
inspect(head(sort(itemsets, by="support"),10))
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.6, target="rules"))
inspect(rules[1:10])

# visualise
plot(rules)

crules <- rules[quality(rules)$confidence > 0.9]
plot(crules, method="matrix", measure=c("lift","confidence"),control=list(reorder=TRUE))

lrules <- head(sort(rules),by="lift",5)
plot(lrules, method="graph", control=list(type="items"))
