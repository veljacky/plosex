clear;
N = 100000;

% Generate A
samplesA = generateA(N);
mean_A = mean(samplesA);
std_dev_A = std(samplesA);
median_A = median(samplesA);

% Generate B
samplesB = generateB(N);
mean_B = mean(samplesB);
std_dev_B = std(samplesB);
median_B = median(samplesB);

% Calculated real data definition for comparision
mean_A_real = 1/4;
median_A_real = 0.0;
std_dev_A_real = sqrt(37/48);

mean_B_real = -1/12;
median_B_real = 0.0;
std_dev_B_real = sqrt((5.0 / 12.0) - (1.0 / 144.0));

% Print data
fprintf("PDF A\nEstimated Values:\n");
fprintf("\tMean=%f, Median=%f, Standard Deviation=%f\n", mean_A, median_A, std_dev_A);
fprintf("Real values:\n");
fprintf("\tMean=%f, Median=%f, Standard Deviation=%f\n\n", mean_A_real, median_A_real, std_dev_A_real);

fprintf("PDF B\nEstimated Values:\n");
fprintf("\tMean=%f, Median=%f, Standard Deviation=%f\n", mean_B, median_B, std_dev_B);
fprintf("Real values:\n");
fprintf("\tMean=%f, Median=%f, Standard Deviation=%f\n", mean_B_real, median_B_real, std_dev_B_real);

subplot(2,1,2)
h = hist(samplesB, 10);
h = h/sum(h);
bar(-0.9:0.2:1, h, 1.0);
title("Histogram PDF B")

subplot(2,1,1)
h = hist(samplesA, 3);
h = h/sum(h);
bar(-0.5:1:1.5, h, 1.0)
title("Histogram PDF A")

% ******************************************************************************
% Functions
% ******************************************************************************
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
