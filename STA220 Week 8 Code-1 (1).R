# STA220 Week 8 R Code

##### FINDING THE QUANTILE OF DISTRIBUTIONS

# 1. To find the value such that there is area p to the left of Normal distribution
# qnorm(p=?, mean=?, sd=?)

qnorm(p=0.5, mean=0, sd=1)

# 2. To find the value such that there is area p to the left of T distribution
# qt(p=?, df=?)

qt(p=0.5, df=1)

# How can we use this to help us compute critical values? 

# Suppose we are interested in a 95% confidence interval
# We want to find a value such that the area to the left is 0.05/2 = 0.025
qnorm(p=0.025, mean=0, sd=1)
qt(p=0.025, df=100-1) #assuming n=100
qt(p=0.025, df=100-1, lower.tail = FALSE)


##### FINDING THE AREA UNDER THE DISTRIBUTION

# 1. To find the area under the normal distribution from -Infinity to q
# pnorm(q=?, mean=?, sd=?)
pnorm(q=0, mean=0, sd=1)

# 2. To find the area under the T distribution from -Infinity to q
# pt(q=?, df=?)
pt(q=0, df=1)

# How can we use this to help us compute p-values? (TBD)

##### CONFIDENCE INTERVALS FOR PROPORTIONS

# Let's define the information we have
n <- 50
n_success <- 17
p_hat <- n_success/n

alpha <- 0.05
crit_val <- qnorm(alpha/2)

# Generally we prefer our critical values to be positive though

crit_val <- qnorm(1-alpha/2)
crit_val <- abs(qnorm(alpha/2))

# Calculate the 95% CI

p_hat - crit_val * sqrt(0.5*0.5/n)
p_hat + crit_val * sqrt(0.5*0.5/n)

# Alternatively, there are built-in functions to calculate the CI

prop.test(x=17, n=50, conf.level=0.95, correct=FALSE)$conf.int

# Note the prop.test() function produces different results since it uses different methodology
# In STA220, we apply CLT to get the sampling distribution of p-hat, and use that to get CI
# prop.test() uses another technique that is covered in STA221

##### CONFIDENCE INTERVALS FOR MEANS

# Let's read in the skeleton data
# You can read about the skeleton data here: https://courses.utstat.utoronto.ca/STA220/data/the-skeleton-data/

# We usually see datasets in csv format. But, this dataset is in txt format. 
# For txt format, we use read.table() instead of read.csv()

skeleton_data <- read.table("SkeletonDataComplete.txt",header=TRUE)

# We want a 95% CI for the DGerror variable. 
# This is the difference between the actual and estimated age at death. 

# Calculate the values that we need
alpha <- 0.05

n <- length(skeleton_data$DGerror)

x_bar <- mean(skeleton_data$DGerror)

s <- sd(skeleton_data$DGerror)

crit_value <- qt(p=alpha/2, df=n-1, lower.tail = FALSE)

# Calculate the 95% CI

x_bar - crit_value * s / sqrt(n)
x_bar + crit_value * s / sqrt(n)


# Alternatively, there are built-in functions to calculate the CI

t.test(x=skeleton_data$DGerror,conf.level=0.95)$conf.int

# We get very similar information using the t.test() function. 

