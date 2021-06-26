% Constants 
N = 100;

figure;
[Y1, X1] = calculate(N, 0.0);
scatter(X1, Y1);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = 0.0");

figure;
[Y2, X2] = calculate(N, 0.5);
subplot(1,2,1);
scatter(X2, Y2);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = 0.5");

[Y3, X3] = calculate(N, -0.5);
subplot(1,2,2);
scatter(X3, Y3);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = -0.5");

figure;
[Y4, X4] = calculate(N, 0.9);
subplot(1,2,1);
scatter(X4, Y4);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = 0.9");

[Y5, X5] = calculate(N, -0.9);
subplot(1,2,2);
scatter(X5, Y5);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = -0.9");

figure;
[Y6, X6] = calculate(N, 1);
subplot(1,2,1);
scatter(X6, Y6);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = 1.0");

[Y7, X7] = calculate(N, -1);
subplot(1,2,2);
scatter(X7, Y7);
xlabel("X");
ylabel("Y");
title("\rho_{XY} = -1.0");


% Function generate realizations
function [Y, X] = calculate(N, rho)
    X = randn(N, 1);
    Z = randn(N, 1);
    
    a = rho;
    b = sqrt(1 - a^2);
    
    Y = a*X + b*Z;
end