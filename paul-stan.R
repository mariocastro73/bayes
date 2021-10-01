library("rstan")
cores <- parallel::detectCores()-1
options(mc.cores = cores)

# Simulating some data
n <-  14
k <- 12

stancode <- '
data {
  int<lower=1> n;
  int<lower=0> k;
} 
parameters {
  real<lower=0,upper=1> theta;
} 
model {
  k ~ binomial(n,theta);
  theta ~ beta(1,1);
}'

mod <- stan_model(model_code = stancode, verbose = TRUE) # Uses stan_model for "string" version of the code
fit <- sampling(mod, data = list(k=k,n=n)) # Use default parameters

print(fit) # Show summary statistics of fitted parameters
plot(fit) # Show catterpilar plot
params = extract(fit) # Extract into data frame

par(mfrow=c(1,2)) # Some plotting
ts.plot(params$theta,xlab="Iterations",ylab=expression(theta))
hist(params$theta,xlab=expression(theta),probability=TRUE,main="Posterior density")
