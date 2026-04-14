# STA220 Week 11 R Code


##### TWO-SAMPLE PAIRED T-TEST (Week 11 Slide 17)

boys <- c(17,27,31,17,25,32,28,23,25,16,11,34)
girls <- c(24,7,14,16,2,15,19,25,10,27,31,8)

diffs <- boys - girls
diffs

xbar <- mean(diffs)
s <- sd(diffs)
n <- length(diffs)
t <- (xbar - 0)/(s/sqrt(n))

p_val <- 2*pt(abs(t), df = (n-1), lower.tail = FALSE) #we will take the area under the t distribution curve ABOVE the absolute value of t. Then multiply that by 2 to get the two sided test p value. 
p_val

# Alternatively, create a CI for the true difference (Week 11 Slide 20)

alpha <- 0.05
crit_val <- qt(alpha/2, df = n-1)
crit_val <- abs(crit_val)

CI <- c(xbar - crit_val*s/sqrt(n),xbar + crit_val*s/sqrt(n))
CI

##### TWO-SAMPLE SIGN TEST (Week 11 Slide 25)

boys <- c(17,27,31,17,25,32,28,23,25,16,11,34)
girls <- c(24,7,14,16,2,15,19,25,10,27,31,8)
diffs <- boys - girls
signs <- diffs > 0
signs
sum(signs) #there are 8 positive differences, and thus 4 negative differences

#dbinom(k, n, p).   P(X=k), X~Bin(n,p)
p_val <- dbinom(8,12,0.5) + dbinom(9,12,0.5) + dbinom(10,12,0.5) + dbinom(11,12,0.5) + dbinom(12,12,0.5) + #P(X>=8)
  dbinom(4,12,0.5) + dbinom(3,12,0.5) + dbinom(2,12,0.5) + dbinom(1,12,0.5) + dbinom(0,12,0.5) #P(X <= 4)
p_val

##### TWO-SAMPLE UNPAIRED T-TEST using UNPOOLED METHOD (Week 11 Slide 34)

#class 1
xbar1 <- 85
n1 <- 50
s1 <- 5

#class2
xbar2 <- 80
n2 <- 40
s2 <- 4

df <- (s1^2/n1 + s2^2/n2)^2/((s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1))
df

se.unpooled <- sqrt(s1^2/n1 + s2^2/n2)
test.stat <- (xbar1 - xbar2)/se.unpooled
test.stat

2*pt(abs(test.stat), 88, lower.tail = FALSE)

##### TWO-SAMPLE UNPAIRED T-TEST using POOLED METHOD (Week 11 Slide 35)

sp <- sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2))
se.pooled <- sp*sqrt(1/n1 + 1/n2)
test.stat <- (xbar1 - xbar2)/se.pooled
test.stat
2*pt(abs(test.stat), 88, lower.tail = FALSE)


##### TWO-SAMPLE UNPAIRED T-TEST FOR PROPORTIONS 

#Confidence Interval (Week 11 Slide 42)

p1 <- 0.34 
n1 <- 60 #online
p2 <- 0.31
n2 <- 50 #newspaper
alpha <- 0.05

crit.val <- abs(qnorm(alpha/2))
se.prop.CI <- sqrt(p1*(1-p1)/n1 + p2*(1-p2)/n2)
CI <- c(p1 - p2 - crit.val*se.prop.CI, p1 - p2 + crit.val*se.prop.CI)
CI

# Hypothesis test (Week 11 Slide 43)

p.hat.pooled <- (n1*p1+n2*p2)/(n1+n2)
z.stat <- (p1-p2)/sqrt(p.hat.pooled*(1-p.hat.pooled)*(1/n1 + 1/n2))
p.val <- 2*pnorm(-abs(z.stat))
p.val
