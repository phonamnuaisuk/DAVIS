# Exercise 4

# Bayesian
# P(burglery) = 0.001
# P(alarm|burglery) = 0.95
# P(alarm|~burglery) = 0.005
# Find P(burglery|alarm)


# weather
getwd()
setwd("C:/Users/My HP/Desktop/05Teaching/CRC5VIS/_Lectures")
weather <- read.csv("dataR/weather.csv")

# prior calculation
weather[weather$play=="yes",]
weather[weather$play=="no",]
nrow(weather[weather$play=="no",])
# from this data find the posterior 
# P(play="yes"|outlook="ocercast",temperature="hot",humidity="high",wind="normal")
# P(A|B,C,D,E) = P(B,C,D,E|A)*P(A) / P(B,C,D,E)
# Naive Bayes makes an independent assumption that
# P(B,C,D,E|A) --> P(B|A)*P(C|A)*P(D|A)*P(E|A)


# Linear Regression
# The predictor vector.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# The resposne vector.
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
plot(y,x,col="blue",main="Height&Weight")

# Apply the lm() function.
relation <- lm(y~x)

# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)
require(graphics)
plot(x,y,col="blue",main="Height&Weight", abline(lm(y~x)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# visualise two variables with regression
x <- runif(75, 0, 10)
x <- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)
lr <- lm(y~x)
lrfit <- predict(lr)
lines(x,lrfit)
#
pol <- loess(y~x)
nrfit <- predict(pol)
lines(x,nrfit)


# Multiple linear regression
input <- mtcars[,c("mpg","disp","hp","wt")]
print(head(input))
plot(input)
mr <- lm(mpg~disp+hp+wt, data = input)
mrfit <- predict(mr)




