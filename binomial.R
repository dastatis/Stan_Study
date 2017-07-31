
# install.packages("rstan")

library("rstan")
# rstan_options(auto_write = TRUE)
# options(mc.cores = parallel::detectCores())

model <- '
data{
  int N;
  int Y; 
}
parameters{
  real<lower=0, upper=1> theta;
}
model{
  Y ~ binomial(N, theta);
}

'

N <- 10
Y <- 8

dat <- list(N=N, Y=Y)

fit <- stan(model_code = model, data = dat,
            iter = 1000, warmup = 500,
            chains = 3 , seed = 1234, thin = 1)

fit
stan_dens(fit) # 事後分布可視化
