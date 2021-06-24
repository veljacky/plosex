clear;

N = 10000;
a = 1;
b = 100;

X = a + (b - a) .* rand(N,1);
Y = round(X);
Z = X-Y;
mean_z = mean(Z)
variance_z = var(Z)

barsN = 10;
h = hist(Z, barsN);
h = h/sum(h);

start = -0.5;
stop = 0.5;
step = (stop-start)/ barsN;
x_axis = start+step/2:step:stop-step/2;

% Plot histogram
bar(x_axis, h, 1.0);
xlim([-0.55, 0.55])
title("Histogram of Z random variable")