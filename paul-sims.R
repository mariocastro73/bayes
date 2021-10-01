n_draw <- 10000
set.seed(1234)

# Defining and drawing from the prior distribution
prior_rate <- runif(n_draw, 0, 1)

# Defining the generative model
gen_model <- function(rate) {
  success <- rbinom(1, size = 14, prob = rate)
  return(success)
}

# Simulating the data
success <- rep(NA, n_draw)
for(i in 1:n_draw) {
  success[i] <- gen_model(prior_rate[i])
}
success

# Filtering out those parameter values that didn't result in the
# data that we actually observed
post_rate <- prior_rate[success == 12]

# Checking that there enough samples left
length(post_rate)
par(mfrow=c(2,1))
hist(prior_rate, xlim = c(0, 1))
hist(post_rate, xlim = c(0, 1))
abline(v=.5,lwd=4)
mean(post_rate)
quantile(post_rate, c(0.025, 0.975))
sum(post_rate > 0.5) / length(post_rate)
