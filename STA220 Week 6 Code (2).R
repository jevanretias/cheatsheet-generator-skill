# STA220 Week 6 R Code

##### REVISITING QNORM AND PNORM FUNCTIONS

# We have already learned in class how to use the pnorm and qnorm functions. 
# Now, we will see more inputs for these functions. 

##### FINDING THE QUANTILE OF DISTRIBUTIONS

# 1. To find the value such that there is area p to the left of Normal distribution
# qnorm(p=?, mean=?, sd=?)

qnorm(p=0.5, mean=10, sd=3)

# How can we use this to help us compute critical values? 

# Suppose we are interested in a 95% confidence interval
# We want to find a value such that the area to the left is 0.05/2 = 0.025
qnorm(p=0.025, mean=0, sd=1)



##### FINDING THE AREA UNDER THE DISTRIBUTION

# 1. To find the area under the normal distribution from -Infinity to q
# pnorm(q=?, mean=?, sd=?)
pnorm(q=0, mean=0, sd=1)

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
