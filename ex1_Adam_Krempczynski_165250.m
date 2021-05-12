N = 1000;
mean = 2;
variance = 2;

% A uniform PDF
a = 2 - sqrt(6);
b = 2 + sqrt(6);

uniform_vars = a + (b - a) .* rand(N, 1);
subplot(3,1,1);
plot(uniform_vars);
ylim([-3, 7]);
title("Uniform PDF");

% B gaussian PDF
std_dev = sqrt(variance);
gaussian_vars = mean + std_dev*randn(N,1);
subplot(3,1,2);
plot(gaussian_vars);
ylim([-3, 7]);
title("Gaussian/Normal PDF");

% C Laplace PDF
% Laplace PDF characterized by mean and b where variance is equal to 2b^2
b = 1;
% Laplace PDF can be generated using uniform distribution in interval [-1/2, 1/2]
uni_vars = -0.5 + 1 .* rand(N, 1);
laplace_vars = mean - b*sign(uni_vars).*log(1-2*abs(uni_vars));
subplot(3,1,3);
plot(laplace_vars);
ylim([-3, 7]);
title("Laplace PDF");

