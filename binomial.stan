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
