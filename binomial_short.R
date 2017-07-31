
# install.packages("rstan")

library("rstan")
# rstan_options(auto_write = TRUE)
# options(mc.cores = parallel::detectCores())

N <- 10
Y <- 8

dat <- list(N=N, Y=Y)

fit <- stan(file = "binomial.stan", data = dat,
            iter = 1000, warmup = 500,
            chains = 3 , seed = 1234, thin = 1)

fit
stan_dens(fit) # 事後分布可視化
