# 1
n <- 9
u <- 1100
s <- 30
quantile = 0.975 # is 95% with 2.5% on both sides of the range
confidenceInterval = u + c(-1, 1) * qt(quantile, df=n-1) * s / sqrt(n)

# 2
n <- 9
averageDifference <- -2
quantile = 0.975 # is 95% with 2.5% on both sides of the range
ci_up = 0
s = (ci_up - averageDifference * sqrt(n))/qt(quantile, df=n-1)
round(s, 2)

# 4
quantile = 0.975 # is 95% with 2.5% on both sides of the range

n_y <- 10 # nights new system
n_x <- 10 # nights old system
var_y <- 0.60 # variance new (sqrt of σ)
var_x <- 0.68 # variance old (sqrt of σ)
u_y <- 3# average hours new system
u_x <- 5# average hours old system

s_p <- sqrt(((n_x - 1) * var_x + (n_y - 1) * var_y)/(n_x + n_y - 2)) # calculate pooled standard deviation

confidenceInterval <- u_y - u_x + c(-1, 1) * qt(quantile, df=n_y+n_x-2) * s_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,2)

# 6
quantile = 0.975 # is 95% with 2.5% on both sides of the range

n_y <- 100 # nights new system
n_x <- 100 # nights old system
s_y <- 0.50# σ new
s_x <- 2# σ old
u_y <- 4# average hours new system
u_x <- 6# average hours old system

s_p <- sqrt(((n_x - 1) * s_x^2 + (n_y - 1) * s_y^2)/(n_x + n_y - 2)) # calculate pooled standard deviation

confidenceInterval <-  u_x - u_y + c(-1, 1) * qnorm(quantile) * s_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,2)

# 7
quantile = 0.95 # is 90% with 5% on both sides of the range

n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
s_y <- 1.5# kg/m2 std.dev. treated
s_x <- 1.8# kg/m2 std.dev. placebo
u_y <- -3#  kg/m2 average difference treated
u_x <- 1#  kg/m2 average difference placebo

s_p <- sqrt(((n_x - 1) * s_x^2 + (n_y - 1) * s_y^2)/(n_x + n_y - 2)) # calculate pooled standard deviation

confidenceInterval <-  u_y - u_x + c(-1, 1) * qt(quantile, df=n_y+n_x-2) * s_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,3)