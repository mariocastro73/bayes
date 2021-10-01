n_draw <- 10000

# Defining and drawing from the prior distribution
dice <- c(4,6,8,10,12,20,100)
prior_rate <- sample(dice,n_draw,replace=TRUE)

# Defining the generative model
gen_model <- function(faces) {
  return(sample.int(faces,1))
}

# Simulating the data
success <- rep(NA, n_draw)
for(i in 1:n_draw) {
  success[i] <- gen_model(prior_rate[i])
}

# Filtering out those parameter values that didn't result in the
# data that we actually observed
post_rate <- prior_rate[success == 7]

# Checking that there enough samples left
length(post_rate)
par(mfrow=c(2,1))
table(prior_rate)
table(post_rate)
prop.table(table(prior_rate))
prop.table(table(post_rate))
