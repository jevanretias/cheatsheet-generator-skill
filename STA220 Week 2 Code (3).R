# STA220 Week 2 R Code 

# ARITHEMETIC
2 + 8
9 / 2
(4 + 3) / (5 * (8-17))

# ASSIGNMENT FUNCTION
# The assignment function <- allows you to assign a particular value to a variable.

x <- 2
y <- -9

# Notice that the values for x and y also now appear in the "Environment" tab in R Studio. 
# The single equal sign also works. 

x = 8
y = 9.32

# VECTORS
# Vectors are created using the c() function

a <- c(1, 4, 2, 9)
b <- c(1)
d <- c() #can even have a vector of length 0


# The length function allows you to determine the length of a vector. 

length(a)
length(b)
length(d)


# Vectors are very useful when programming in R. Anything you can think about doing with them, you can probably do -- it's just a matter of figuring out the R syntax for it. 

a <- c(1, 9, 5, 8, 7.1)
b <- c(6, -4, 2, 7, 0)

# add vectors (element wise)
a + b


# multiply vectors (element wise)
a * b

#exponentiate
a ^ 2

# max or min
max(a)
min(b)

# mean and standard deviation
mean(b)
sd(b)

# access specific elements
a[2]
a[c(2,4)]

# There are also some useful functions that make it easier to create vectors. 

# vector of consective integers
x <- 2:10

# vector of repeated value
y <- rep(3, 10)

# sequence function
z <- seq(from=1, to=9)
z <- seq(from=1, to=9, by=2)

# CHECKING EQUALITY
# The double equal sign allows us to check if 2 values are equal

2 == 1

a <- 2
a == 2

a <- c(1, 9, 5, 8, 7.1)
b <- c(6, -4, 2, 7, 0)
a == b

# DATA IN VECTORS

# Many times, your data may be held in a vector. 

grade_data <- c(70, 84, 92, 49, 71, 81, 93, 91, 59, 81, 90, 77, 72, 81, 67)

# 5-number summary
summary(grade_data)

# mean
mean(grade_data)

# variance
var(grade_data)

# standard deviation
sd(grade_data)

# 25th and 75th percentiles
quantile(grade_data, 0.25) #Q1
quantile(grade_data, 0.75) #Q3


