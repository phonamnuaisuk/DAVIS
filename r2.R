# Exercise 2

# more arithemetic
x <- 1:10
y <- 2
x/y

y <- c(2,4)
x/y

# more vector
single <- 1
nu <- c(1,3,5,7,5)
ch <- c("spades","hearts","spades","diamonds")
lo <- c(TRUE,FALSE,TRUE)
is.vector(nu)
is.vector(ch)
is.vector(lo)
is.vector(single)

capital <- c("BKK", "BWN", "PKG", "KUL")
country <- c("TH", "BN", "CN", "MY")
capital
country
capital2 <- capital
country2 <- country
names(capital) <- country
names(country2) <- capital2
capital
capital["BN"]
country2
country2["BKK"]

wrdcount <- c(human = 10, fox = 5, moon = 8, engineer = 2)
wrdcount <- c("human" = 10, "fox" = 5, "moon" = 8, "engineer" = 2)
wrdindex <- c("1"=10, "2"=20, "3"=30, "4"=40)

# subset a vector by index
wrdindex[2]
wrdindex[1:3]
wrdindex[c(1,3)]
wrdindex[c(TRUE,FALSE,TRUE,TRUE)]


# more matrix
z <- matrix(rnorm(20),nrow=5)
z
rownames(z) <- c('A','E','I','O','U')
z
colnames(z) <- c('C.1','C.2','C.3','C.4')
z
round(z)
round(z,digit=2)
z

m <- matrix(1:6, byrow = TRUE, nrow=2, dimnames = list(c("r1","r2"),c("c1","c2","c3")))


cbind(matrix(1:5,nrow=5),matrix(1:5,nrow=5))

# data.frame

year <- c(2010:2016)
papers <- c(3,2,4,5,1,3,4)
KPI <- data.frame(year,papers)
KPI$year
KPI <- data.frame(Y=year,P=papers)
KPI$Y
KPI[,1]
KPI[,1:2]
KPI
impact <- c(5,4,3,4,5,5,4)
KPI <- cbind(KPI,impact)
KPI <- rbind(KPI, c(2017,3,5))
names(KPI) <- c('Y','P','I')

#
v <- c("Hello","loop"); cnt <- 2
repeat {
  print(v)
  cnt <- cnt+1
  if(cnt > 5) {
    break
  }
}

#
v <- c("Hello","while loop")
cnt <- 2

while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}
#
v <- LETTERS[1:4]

for ( i in v) {
  print(i)
}
#
v <- LETTERS[1:6]
for ( i in v) {
  
  if (i == "D") {
    next
  }
  print(i)
}
#
myadd <- function(a=3,b=2) {
 return(a+b) 
}
#
myfib <- function( num ) {
  result <- c(1,1)
  if ( num > 2 && num < 100 ) {
    for( n in 1:num ) {
      m <- length(result)
      result <- c(result, result[m] + result[m-1])
    }
  }
  return( result )
}




# input/output
write.csv(z,"myz.csv",row.name=FALSE)

a <- scan()
a <- readline(" Name : ")

# built-in data
iris
cars
mtcars

# access data using subset
?subset
subset(mtcars, mtcars$gear==4)

# access data index
mtcars[mtcars$gear==4, ]

# visualise one variable
# rlnorm random log normal
income <- rlnorm(4000,meanlog=4,sdlog=0.7)
summary(imcome)
plot(income)
hist(income)
plot(density(income))
plot(density(log10(income)))

# visualise two variables with regression
x <- runif(75, 0, 10)
x <- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)
lr <- lm(y~x)
fit <- predict(lr)
lines(x,fit)
#
pol <- loess(y~x)
fit <- predict(pol)
lines(x,fit)
