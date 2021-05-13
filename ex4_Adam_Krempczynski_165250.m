clear;
N = 10000;
mean = 2;

% Generate C - Laplace variable
b = 1;
uni_vars = -0.5 + 1 .* rand(N, 1);
laplace_vars = mean - b*sign(uni_vars).*log(1-2*abs(uni_vars));

% Generate D - Cauchy variable C(2,1)
variance = 1;
std_dev = sqrt(variance);

X = mean + std_dev*randn(N,1);
Y = mean + std_dev*randn(N,1);
cauchy_vars = X ./ Y;

% Histograms
x_axis = -2.5:0.5:7;
%% C variable histogram
c_hist = hist(laplace_vars, 20);
c_hist = c_hist/sum(c_hist);

%% D variable histogram
d_hist = hist(cauchy_vars, 20);
d_hist = d_hist/sum(d_hist);

% Calculate expected PDFs
x = -3:0.001:7;

%% Laplace pdf
laplace_pdf = 1/(2*b) * exp(-1 * (abs(x-mean)/b));

% Cauchy pdf
a = 2;
b = 1;

cauchy_pdf = b/pi ./ (b^2 + (x-a).^2);

%% Plot results
subplot(2,1,1);
plot(x, laplace_pdf);
hold on;
bar(x_axis, c_hist);
hold off;

subplot(2,1,2);
plot(x, cauchy_pdf);
hold on;
bar(x_axis, d_hist);
hold off;