library(psych)

data = c(16, 18, 22, 25, 27)
data <- list(m=length(k),k=k,nmax=1000)
nmax=1000
nsamples <- 1000000
p <- rbeta(nsamples,1,1)
N <- sample.int(nmax,nsamples,replace = TRUE)
idx <- rbinom(nsamples,N,p) %in% data
df <- data.frame(p=p[idx],N=N[idx])
pairs.panels(df)
