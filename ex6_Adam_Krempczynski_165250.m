clear;
N = 10000;
R = 16;

% Ex 5 PDF A
mean_A = 1/4;
std_dev_A = sqrt(37/48);

E = zeros(N, R);
for i=1:R
  E(:, i) = (generateA(N)-mean_A)/std_dev_A;
end

F = 1/4 * sum(E, 2);
F_hist = hist(F, 20);
F_hist = F_hist/sum(F_hist);

x = -5:0.001:5;
std_dev = 1;
mean = 0;
gaussian_vars = 1/(std_dev *sqrt(2*pi)) * exp(-1* (x-mean).^2/(2*std_dev^2));

% Plot histogram A and gaussian pdf
x_axis = -4.5:0.5:5;
subplot(2,1,1)
bar(x_axis, F_hist, 1.0);
hold on;
plot(x, (1/2.75)*gaussian_vars);
title("Ex. 5 PDF A");
hold off;

% Generate B
mean_B = -1/12;
std_dev_B = sqrt((5.0 / 12.0) - (1.0 / 144.0));

E2 = zeros(N, R);
for i=1:R
  E2(:, i) = (generateB(N)-mean_B)/std_dev_B;
end

F2 = 1/4 * sum(E2, 2);
F2_hist = hist(F2, 20);
F2_hist = F2_hist/sum(F2_hist);

% Plot histogram B and gaussian pdf
subplot(2,1,2)
bar(x_axis, F2_hist, 1.0);
hold on;
plot(x, (1/2.666)*gaussian_vars);
hold off;
title("Ex. 5 PDF B");

function samples = generateA(no_samples)
  a = -1; % left side of pdf
  b = 2;  % right side of pdf
  max_val = 0.5;
  samples = zeros(no_samples, 1);
  
  samples_ctr = 1;
    while samples_ctr <= no_samples
        x = a + (b-a) * rand(1,1);
        y = max_val * rand(1,1);

        if (x <= 0 && y <=0.5) || (x > 0 && y <= 0.25)
          samples(samples_ctr) = x;
          samples_ctr = samples_ctr + 1;
        end
    end
end

function samples = generateB(no_samples)
  a = -1; % left side of pdf
  b = 1;  % right side of pdf
  max_val = 1;
  samples = zeros(no_samples, 1);
  
  samples_ctr = 1;
  while samples_ctr <= no_samples
    x = a + (b-a) * rand(1,1);
    y = max_val * rand(1,1);
    if (x <= 0 && y <= x*(-1)) || (x > 0 && y <= 0.5)
      samples(samples_ctr) = x;
      samples_ctr = samples_ctr + 1;
    end
  end
end