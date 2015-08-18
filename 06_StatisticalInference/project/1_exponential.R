# histogram of 1000 exponential distribution
hist(rexp(10000, 0.2))

# histogram of 1000 means of 40 exponential distribution
mns = NULL
for (i in 1: 1000) mns = c(mns, mean(rexp(40, 0.2)))
hist(mns)

# theoretical mean of an exponential distribution is 1/lambda
theoretical_mean = 1/0.2

# theoretical standard deviation of an exponential distribution is 1/lambda
theoretical_sd = 1/0.2

# theoretical standard deviation of an exponential distribution is lambda^-2
theoretical_sd = 0.2^-2

# histogram of 1000 variances of 40 exponential distribution
vrs = NULL
for (i in 1: 1000) vrs = c(vrs, var(rexp(40, 0.2)))
hist(vrs)

