import stan

stancode = """
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
}
"""

data = {"k": 12, "n":14}

posterior = stan.build(stancode, data=data)
fit = posterior.sample(num_chains=4, num_samples=1000)
eta = fit["theta"]  # array with shape (8, 4000)
df = fit.to_frame()  # pandas `DataFrame, requires pandas
print(df)
