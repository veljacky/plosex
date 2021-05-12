% Samples Number
N_list = [100, 1000, 10000, 100000];
mean = 2;
variance = 2;

for N = N_list
  % In each iteration generate all neccessary random variables
  %% Uniform
  a = 2 - sqrt(6);
  b = 2 + sqrt(6);
  uniform_vars = a + (b - a) .* rand(N, 1); 
  
  %% Gaussian
  std_dev = sqrt(variance);
  gaussian_vars = mean + std_dev*randn(N,1);
  
  %% Laplace
  b = 1;
  uni_vars = -0.5 + 1 .* rand(N, 1);
  laplace_vars = mean - b*sign(uni_vars).*log(1-2*abs(uni_vars));
  
  %% Cauchy 
  variance_c = 1;
  std_dev_c = sqrt(variance_c);

  X = mean + std_dev_c*randn(N,1);
  Y = mean + std_dev_c*randn(N,1);
  cauchy_vars = X ./ Y;
  
  % Estimate mean and variance based on each random variables
  %% Uniform
  mean_u = sum(uniform_vars)/length(uniform_vars);
  variance_u = sum((uniform_vars - mean_u).^2)/length(uniform_vars);
  
  %% Gaussian
  mean_g = sum(gaussian_vars)/length(gaussian_vars);
  variance_g = sum((gaussian_vars - mean_g).^2)/length(gaussian_vars);
  
  %% Laplace
  mean_l = sum(laplace_vars)/length(laplace_vars);
  variance_l = sum((laplace_vars - mean_l).^2)/length(laplace_vars);
  
  %% Cauchy 
  mean_cauch = sum(cauchy_vars)/length(cauchy_vars);
  variance_cauch = sum((cauchy_vars - mean_cauch).^2)/length(cauchy_vars);
  
  % Print data
  fprintf("Estimates calculated for N=%d\n", N);
  fprintf("Uniform distribution:\n");
  fprintf("\tMean=%f, Variance=%f\n", mean_u, variance_u);
  fprintf("Normal distribution:\n");
  fprintf("\tMean=%f, Variance=%f\n", mean_g, variance_g);
  fprintf("Laplace distribution:\n");
  fprintf("\tMean=%f, Variance=%f\n", mean_l, variance_l);
  fprintf("Cauchy distribution:\n");
  fprintf("\tMean=%f, Variance=%f\n", mean_cauch, variance_cauch);
  fprintf("\n");
end
