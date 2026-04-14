# STA220 Week 9 R Code


##### HYPOTHESIS TESTING FOR PROPORTIONS

# Let's define the information we have
n <- 50
n_success <- 17
p_hat <- n_success/n

alpha <- 0.05

# H_0: p = 0.25
# H_A: p =/= 0.25

# Calculate the test statistic
p_null <- 0.25

z_stat <- (p_hat - p_null) / (sqrt(p_null*(1-p_null)/n))


# Calculate the p-value

p_value <- 2*pnorm(-z_stat)

# Alternatively, there are built-in functions to run a similar test

prop.test(x=17, n=50, p=0.25, conf.level=0.95, correct=FALSE)

# Note the prop.test() function produces slightly different results since it uses different methodology
# It doesn't even have a Z-statistic. Instead it uses a X^2 Statistic (taught in STA221)
# On the Assignment, you shouldn't use this function as you won't get the Z-statistic

##### HYPOTHESIS TESTING FOR MEANS

# Let's read in the skeleton data which we first saw in Week 8's code
# You can read about the skeleton data here: https://courses.utstat.utoronto.ca/STA220/data/the-skeleton-data/

skeleton_data <- read.table("SkeletonDataComplete.txt",header=TRUE)

# We are interested in the DGerror variable. 
# Let mu be the true mean of DGerror

# H_0: mu = -10
# H_A: mu =/= -10 

# Calculate the test statistic

alpha <- 0.05
n <- length(skeleton_data$DGerror)
x_bar <- mean(skeleton_data$DGerror)
s <- sd(skeleton_data$DGerror)
mu_null <- -10

t_stat <- (x_bar - mu_null)/(s / sqrt(n))

# Calculate the p-value

p_value <- 2*pt(t_stat, df=n-1)

# Alternatively, there are built-in functions to run this test

t.test(x=skeleton_data$DGerror, mu=-10, conf.level = 0.95)

# Recall that this is the same function that creates CI for means

t.test(x=skeleton_data$DGerror, mu=-10, conf.level = 0.95)$conf.int

# Also works for one-sided tests

# H_A: mu < -10
t.test(x=skeleton_data$DGerror, alternative = "less", mu=-10, conf.level = 0.95)

# H_A: mu > -10
t.test(x=skeleton_data$DGerror, alternative = "greater", mu=-10, conf.level = 0.95)



