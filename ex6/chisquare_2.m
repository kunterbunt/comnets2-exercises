
clear

k=32 %Intervals

%Import values

M1 = csvread('packet_rate_udp.csv');
x=M1(:,2);

%Make intervals
maxValue=max(x);
minValue=min(x);
stepSize=(maxValue-minValue)/k;

intervals=zeros(k,1);

for i=1:k
    for j=1:length(x)
        if x(j)>=(minValue + (i-1)*stepSize) && x(j)<(minValue + i*stepSize)
            intervals(i,1)=intervals(i,1)+1;
        end
    end
end
intervals(k,1)=intervals(k,1)+1; %Add last value

n = sum(intervals);

%Check k
numSmallerFive=0;
for i=1:length(intervals)
    if (intervals(i,1)<5)
        numSmallerFive=numSmallerFive+1;
    end
end
if (min(intervals)<5*numSmallerFive/k)
    msgbox('Invalid number of intervals k','Error','error')
end

%Do x^2 statistic


%expected_frequency=n/k; %Ei=N(F(Yu)?F(Yl))
%for i=1:length(observed)
 %   substract(i,1)=observed(i,1)-expected_frequency;
  %  square_substract(i,1)=(substract(i,1))^2;
   % chi2(i,1)=square_substract(i,1)/expected_frequency;
%end
%for i=1:length(observed)
 %   ocurrance(i,1)=observed(i,1)*i;
%end
%lambda=sum(ocurrance)/sum(intervals);
lambda=mean(x);

for i=1:length(intervals)
    expected_frequency(i,1)=(poisscdf(minValue+i*stepSize,lambda)-poisscdf(minValue+(i-1)*stepSize,lambda))*n;
    
end

for i=1:length(intervals)
    substract(i,1)=intervals(i,1)-expected_frequency(i,1);
    square_substract(i,1)=substract(i,1)^2;
    chi2(i,1)=square_substract(i,1)/expected_frequency(i,1);
end



chi2stat=sum(chi2)



%Test x^2
m=1; %Number of parameters of expected PDF-->Poisson
degree_freedom=k-m-1;
alfa=0.05; %probability of deviations

chi2table = icdf('Chisquare',1-alfa/2,degree_freedom)

if (chi2stat<chi2table)
    h=0 %follows a poisson distribution
else
    h=1
end

%Plot results
plot(intervals,'r')
hold on
plot(expected_frequency,'b')



