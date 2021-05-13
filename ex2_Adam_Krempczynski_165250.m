clear;
% Cauchy random variable can be generated as a ratio of two normally distribuited random variables
mean = 2;
variance = 1;
std_dev = sqrt(variance);

X = mean + std_dev*randn(N,1);
Y = mean + std_dev*randn(N,1);
cauchy_vars = X ./ Y;

plot(cauchy_vars);
ylim([-3, 7]);
title("Cauchy PDF");