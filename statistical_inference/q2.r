# 2
targetDBP <- 70
u <- 80
s <- 10
percentage <- round(pnorm(targetDBP, mean = u, sd = s) * 100)

# 3
quantile <- 0.95
u <- 1100
s <- 75
volume <- round(qnorm(quantile, mean = u, sd = s))

# 4
quantile <- 0.95
u <- 1100
s <- 75
n <- 100
SE <- s/sqrt(n)
round(qnorm(quantile, mean = u, sd = SE))

# 5
p <- 0.5
n <- 5
quantile <- 3 # 4 or 5 out of 5, with lower
probPercentage1 <- round(pbinom(quantile, size=n, prob=p, lower.tail = FALSE) * 100)

combinedProb <- p ^ n
choose4Prob <- choose(n, 4) * combinedProb
choose5Prob <- choose(n, 5) * combinedProb
probPercentage2 <- round((choose4Prob + choose5Prob) * 100)

# 6
u <- 15
s <- 10
n <- 100
SE <- u/sqrt(n)

left <- 14
right <- 16

percentageLeft <- pnorm(left, mean = u, sd = SE) * 100
percentageRight <- pnorm(right, mean = u, sd = SE) * 100

probPercentage <- round(percentageRight - percentageLeft)

# 7
quantile <- 0.5
u <- 0.5
s <- 1/12
n <- 1000
SE <- s/sqrt(n)

qnorm(quantile, mean = u, sd = SE)

# 8
t <- 3
l <- 5
quantile <- 10

probability <- round(ppois(quantile, lambda = t * l), digits=2)
probability