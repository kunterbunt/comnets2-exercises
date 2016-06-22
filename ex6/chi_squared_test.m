function chisquared = chi_squared_test(filename, k)

M1 = csvread(filename);
observed_values = M1(:,2);

chisquared = 1;
observed_max = max(observed_values);
observed_min = min(observed_values);
interval_size = (observed_max - observed_min) / k;
% Compute bins.
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

% Check if condition holds.
if (min(N_j) < 5 * sum(N_j < 5) / k)
    msgbox('Condition fails.','Error','error')
end

% Apply chi-squared-test.
lambda=mean(observed_values);
n = sum(N_j);
for i=1:length(N_j)
    expected_frequency(i,1)=(poisscdf(observed_min + i * interval_size, lambda) - poisscdf(observed_max + (i-1) * interval_size, lambda)) * n;    
end

for i=1:length(N_j)
    substract(i,1)=N_j(i,1)-expected_frequency(i,1);
    square_substract(i,1)=substract(i,1)^2;
    chi2(i,1)=square_substract(i,1)/expected_frequency(i,1);
end
chi2stat=sum(chi2)

%Test x^2
m=1; %Number of parameters of expected PDF-->Poisson
degree_freedom = k - m - 1;
alpha=0.05; %probability of deviations

chi2table = icdf('Chisquare',1-alpha/2,degree_freedom)

if (chi2stat<chi2table)
    h=0 %follows a poisson distribution
else
    h=1
end

%Plot results
plot(N_j, 'r')
hold on
plot(expected_frequency,'b')
h

% N_j
% bins = 1:length(N_j)
% poissonDistribution = fitdist(bins','Poisson','Frequency', N_j);
% n = sum(N_j);
% expectedCounts = n * pdf(poissonDistribution, bins);
% [h, p, st] = chi2gof(bins,'Ctrs', bins, 'Frequency', N_j, 'Expected', expectedCounts, 'NParams',1)
% %plot(st.O, 'r')
% %hold on
% %plot(st.E, 'b')
% h