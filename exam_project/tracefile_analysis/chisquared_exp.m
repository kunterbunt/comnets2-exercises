function followExpDistr = chisquared_exp(filename, k)
file = fopen(filename, 'r');
observed_values = fscanf(file, '%d');

observed_max = max(observed_values)
observed_min = min(observed_values)
interval_size = (observed_max - observed_min) / k;

% Divide into bins.
N_j = zeros(k, 1);
for i = 1:k
    N_j(i) = sum(observed_values <= observed_min + i * interval_size);
    if i > 1
       N_j(i) = N_j(i) - sum(N_j(1:i - 1));
    end
end
% Merge bins if necessary.
i=1;
N_j_length = length(N_j);
while i < N_j_length
    if N_j(i) < 5
        if i < length(N_j)
            N_j(i) = N_j(i) + N_j(i + 1);
            N_j(i + 1) = [];
        else
            N_j(i) = N_j(i) + N_j(i - 1);
            N_j(i - 1) = [];
        end
        N_j_length = N_j_length - 1;
    end
    i = i + 1;
end
% Plot value distribution into bins.
figure;
plot(N_j, 'o');
title('Total occurrences of observed values within intervals');
xlabel('Intervals');
ylabel('Total Occurrences');
set(gca,'FontSize',28)
% Determine expected values.
lambda = mean(observed_values)
expected_frequency = zeros(length(N_j), 1);
for i=1:length(N_j)    
    expected_frequency(i,1) = (expcdf(observed_min + i * interval_size, lambda) - expcdf(observed_max + (i-1) * interval_size, lambda)) * sum(N_j);    
end
% Determine test statistic.
statistic_values = zeros(length(N_j), 1);
for i=1:length(N_j)
    statistic_values = ((N_j(i,1) - expected_frequency(i,1))^2) / expected_frequency(i,1);    
end
chi2stat = sum(statistic_values);
% Reject or accept hypothesis.
m = 1; % Number of parameters of expected PDF --> Exponential only has a mean.
degree_freedom = k - m - 1;
alpha = 0.05;

chi2table = icdf('Chisquare', 1 - alpha, degree_freedom);

if (chi2stat < chi2table)
    display('Observed values follow an Exponential distribution at 99.95% significance level.');
    followExpDistr = 1;
else
    display('Observed values DO NOT follow an Exponential distribution at 99.95% significance level.');
    followExpDistr = 0;
end
end