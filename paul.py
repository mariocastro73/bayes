import numpy as np
import matplotlib.pyplot as plt

n_draw = 10000
np.random.seed(1234)

# Defining and drawing from the prior distribution
prior_rate = np.random.uniform(0, 1, n_draw)

# Defining the generative model
def gen_model(rate):
    success = np.random.binomial(14, rate, 1)
    return success[0]

# Simulating the data
success = np.empty(n_draw)
for i in range(n_draw):
    success[i] = gen_model(prior_rate[i])

# Filtering out those parameter values that didn't result in the data that we actually observed
post_rate = prior_rate[success == 12]

# Checking that there are enough samples left
post_rate_length = len(post_rate)

plt.figure(figsize=(10, 6))
plt.subplot(2, 1, 1)
plt.hist(prior_rate, bins=30, range=(0, 1), edgecolor='black')
plt.xlim(0, 1)
plt.title('Prior Rate Distribution')

plt.subplot(2, 1, 2)
plt.hist(post_rate, bins=30, range=(0, 1), edgecolor='black')
plt.xlim(0, 1)
plt.axvline(x=0.5, linewidth=4, color='r')
plt.title

