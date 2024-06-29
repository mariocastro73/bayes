import numpy as np

n_draw = 10000

# Defining and drawing from the prior distribution
dice = np.array([4, 6, 8, 10, 12, 20, 100])
prior_rate = np.random.choice(dice, n_draw, replace=True)

# Defining the generative model
def gen_model(faces):
    return np.random.randint(1, faces + 1)

# Simulating the data
success = np.empty(len(prior_rate))
for i in range(len(prior_rate)):
    success[i] = gen_model(prior_rate[i])

# Filtering out those parameter values that didn't result in the data that we actually observed
post_rate = prior_rate[success == 7]

# Checking that there are enough samples left
prior_rate_table = np.bincount(prior_rate)
post_rate_table = np.bincount(post_rate)

print(prior_rate_table[dice]/len(prior_rate))
print(post_rate_table[dice]/len(post_rate))
