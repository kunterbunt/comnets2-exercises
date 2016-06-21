%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Confidence interval of TenRunsThousendSec-1.csv
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


alfa=0.05;
m=10; %Number of runs
%Import and plot values


values = csvread('TenRunsThousendSec-1.csv');

%Divide de values in 10 runs:
mean1=mean(values(1:length(values)/10));
mean2=mean(values(1*length(values)/10+1:2*length(values)/10));
mean3=mean(values(2*length(values)/10+1:3*length(values)/10));
mean4=mean(values(3*length(values)/10+1:4*length(values)/10));
mean5=mean(values(4*length(values)/10+1:5*length(values)/10));
mean6=mean(values(5*length(values)/10+1:6*length(values)/10));
mean7=mean(values(6*length(values)/10+1:7*length(values)/10));
mean8=mean(values(7*length(values)/10+1:8*length(values)/10));
mean9=mean(values(8*length(values)/10+1:9*length(values)/10));
mean10=mean(values(9*length(values)/10+1:10*length(values)/10));
%Calculate CI
sampleMeanVector = [mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10];
sampleMean=mean(sampleMeanVector);


sampleVariance=0;
for i=1:10
    sampleVariance=(sampleMeanVector(i)-sampleMean)^2+sampleVariance;
end
sampleVariance=sampleVariance/(m-1);
deviation=sqrt(sampleVariance);

mu = 0;
sigma = 1;
y=1-alfa;
Z=icdf('Normal',y,mu,sigma);

CI=[sampleMean-Z*deviation/sqrt(m),sampleMean+Z*deviation/sqrt(m)]

csvwrite('ConfidenceInterval10runs_1000sec_ISDN.dat',CI)

