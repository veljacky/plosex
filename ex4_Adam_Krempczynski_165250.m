clear;
N = 1000000;
mean = 2;

% Generate C - Laplace variable
b = 1;
uni_vars = -0.5 + 1 .* rand(N, 1);
laplace_vars = mean - b*sign(uni_vars).*log(1-2*abs(uni_vars));
laplace_vars = laplace_vars(laplace_vars >= -3);
laplace_vars = laplace_vars(laplace_vars <= 7);
% Generate D - Cauchy variable C(2,1)
variance = 1;
std_dev = sqrt(variance);

X = std_dev*(randn(N,1));
Y = std_dev*(randn(N,1));
cauchy_vars = mean + X ./ Y;

% Histograms
x_axis = -2.75:0.5:6.75;
%% C variable histogram
c_hist = hist(laplace_vars, 20);
c_hist = c_hist/(0.5*sum(c_hist));

%% D variable histogram
cauchy_vars = cauchy_vars(cauchy_vars <= 7);
cauchy_vars = cauchy_vars(cauchy_vars >= -3);
d_hist = hist(cauchy_vars, 20);
d_hist = d_hist/(sum(d_hist)*0.5);

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
bar(x_axis, c_hist, 1.0);
hold on;
plot(x, laplace_pdf);
hold off;

subplot(2,1,2);
bar(x_axis, d_hist, 1.0);
hold on;
plot(x, cauchy_pdf);
hold off;