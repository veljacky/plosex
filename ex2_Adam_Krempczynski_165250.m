clear;
% Cauchy random variable can be generated as a ratio of two normally distribuited random variables
N = 1000;
mean = 2;
variance = 1;
std_dev = sqrt(variance);

X = std_dev*(randn(N,1));
Y = std_dev*(randn(N,1));
cauchy_vars = mean + X ./ Y;

plot(cauchy_vars);
ylim([-3, 7]);
title("Cauchy PDF");
xlabel("Sample")
ylabel("Y")