# Exercise 1

# basic calculator
2+2+3+2
2*3*4
2**8
2^8
2*pi
5/2
exp(0)
exp(1)
sqrt(25)
log(exp(1))
log2(8)
log10(100)
complex(real=2,imaginary=3)

# variable, assignment and relational ops
x <- 3
4 -> x
x <- "name"
x <- 3
x+x
x*x
x^x
x==x
x!=x
x>x
x>=x
a <- 10
b <- 20
c <- c(-5:5)
x <- c
y <- x^2
plot(x,y)
# subset by index
x <- c(11,3,4,6,20)
x[1] <- -7
x
c

# Logical ops
x <- 0:2; x
y <- 2:0; y
x < 1
y < 1
(x < 1) & (y < 1)
(x < 1) | (y < 1)
(x < 1) && (y < 1)
(x < 1) || (y < 1)

# Data types
i <- 1
sport <- "football"
flag = TRUE
class(i)
class(sport)
class(flag)
class(c)
class(x)
typeof(i)
typeof(sport)
typeof(flag)
typeof(c)
typeof(x)
is.integer(i)
is.integer(sport)
is.integer(flag)
is.integer(c)
is.integer(x)
is.vector(i)
is.vector(sport)
is.vector(flag)
is.vector(c)
is.vector(x)
length(i)
length(sport)
length(flag)
length(c)
length(x)

# Data Frame
year <- c(2010:2016)
papers <- c(3,2,4,5,1,3,4)
KPI <- data.frame(year,papers)
KPI <- data.frame(Y=year,P=papers)
KPI
class(year)
class(papers)
class(KPI)
class(KPI$Y)
class(KPI$P)

# Random number generator
x <- rnorm(10); x
x <- rnorm(10,mean=2); x
x <- rnorm(10,mean=2,sd=0.3); x

# Vector, Matrix and Array
v <- c(-5:5)
m <- matrix(v, nrow = 2); m
m <- matrix(1:10, nrow = 2); m
m <- matrix(1:10, nrow = 2, byrow=TRUE); m
a <- array(1:10,dim=c(2,5)); a
a <- array(1:10,dim=c(3,4)); a
a <- array(1:10,dim=c(2,5,2)); a

# List
r <- list(1,c(1:2),c("3",4),"str1",5.0); r

