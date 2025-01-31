function p = plot_signal_ci(x,y,color)

% This function will plot a mean signal with standard deviation from a set
% of 

N = size(y,1);                                      % Number of ?Experiments? In Data Set
yMean = nanmean(y);                                    % Mean Of All Experiments At Each Value Of ?x?
ySEM = nanstd(y)/sqrt(N);                              % Compute ?Standard Error Of The Mean? Of All Experiments At Each Value Of ?x?
CI95 = tinv([0.025 0.975], N-1);                    % Calculate 95% Probability Intervals Of t-Distribution
yCI95 = bsxfun(@times, ySEM, CI95(:));   % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ?x?

p2 = patch([x fliplr(x)], [yCI95(1,:)+yMean fliplr(yCI95(2,:)+yMean)],...
    color,'FaceAlpha',0.2);
p2.EdgeColor= 'none';

hold on
p = plot(x, yMean,color,'LineWidth',2.5);                                      % Plot Mean Of All Experiments
% p2 = plot(x, yCI95+yMean,color,'LineWidth',0.2);    % Plot 95% Confidence Intervals Of All Experiments
% p2.Color(4) = 0.5;


% hold off
% grid