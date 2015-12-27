# q1
subject <- c(1,2,3,4,5)
baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
examinations <- data.frame(subject, baseline, week2)

test <- t.test(x = examinations$baseline, y = examinations$week2, alt = "two.sided", paired = TRUE)
pval <- test$p.value
round(pval,3)

# q2
n <- 9
u <- 1100
s <- 30
quantile = 0.975 # is 95% with 2.5% on both sides of the range
confidenceInterval = u + c(-1, 1) * qt(quantile, df=n-1) * s / sqrt(n)

# q3
n <- 4
x <- 3
test <- binom.test(x=x, n=n, alt="greater")
round(test$p.value,2)

# q4
rate <- 1/100
errors <- 10
days <- 1787
test <-  poisson.test(errors, T = days, r = rate, alt="less")
round(test$p.value,2)

# q5
n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
s_y <- 1.5 # kg/m2 std.dev. treated
s_x <- 1.8 # kg/m2 std.dev. placebo
u_y <- -3 # kg/m2 average difference treated
u_x <- 1 # kg/m2 average difference placebo

s_p <- (((n_x - 1) * s_x^2 + (n_y - 1) * s_y^2)/(n_x + n_y - 2)) # calculate pooled standard deviation
pval <- pt((u_y - u_x) / (s_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2)
pval

# q7
n <- 100 # subject
u <- 0.01 # m^3 brain volume loss mean
s <- 0.04 # m^3 brain volume loss std. dev.
p <- 0.05 # sign level

pow <- power.t.test(n=n, delta=u, sd=s , sig.level=p, type="one.sample", alt="one.sided")$power
round(pow, 2)

# q8
u <- 0.01 # m^3 brain volume loss mean
s <- 0.04 # m^3 brain volume loss std. dev.
p <- 0.05 # sign level
pow <- 0.9 # power

n <- power.t.test(power=pow, delta=u, sd=s , sig.level=p, type="one.sample", alt="one.sided")$n
ceiling(n/10)*10