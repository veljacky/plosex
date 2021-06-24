% Case 1
x1 = -1:0.1:10;
px1 = exp(-x1).*step(x1);
% plot(x1, px1);
% title("PDF Candidate 1")

% Case 2
x2 = -10:0.1:10;
px2 = exp(-abs(x2));
%plot(x2, px2);
%title("PDF Candidate 2")

% Case 3
x3 = -3:0.1:3;
px3 = 3/4 * (x3.^2 - 1) .* (abs(x3) < 2);
plot(x3, px3);
title("PDF Candidate 3")

% Case 4
x4 = -0:0.1:5;
px4 = 2*x4.*exp(-(x4).^2) .* step(x4);
plot(x4, px4);
title("PDF Candidate 4")

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