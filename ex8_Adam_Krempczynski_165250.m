% Case 1
x1 = -50:0.1:50;
cdf1 = 1/2 + 1/pi*atan(x1);
plot(x1, cdf1);
title("CDF Candidate 1");

% Case 2
x2 = -5:0.1:25;
cdf2 = (1 - exp(-x2)).*step(x2);
plot(x2, cdf2);
title("CDF Candidate 2");

% Case 3
x3 = -5:0.1:5;
cdf3 = exp(-x3.^2);
plot(x3, cdf3);
title("CDF Candidate 3");

% Case 4
x4 = -5:0.1:10;
cdf4 = x4.^2 .* step(x4);
plot(x4, cdf4);
title("CDF Candidate 4");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Necessary functions %%%%%%%%%%%%

function y = step(x)
    y = zeros(size(x));
    for i=1:length(y)
        if x(i) >= 0
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
end