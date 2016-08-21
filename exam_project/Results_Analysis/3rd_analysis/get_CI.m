%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(1-alfa) Confidence interval of a vector of means "filename" with m runs
%i.e: get_CI('TenStudents.csv',20,0.05)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CI = get_CI(filename, m, alfa)

meansVector = csvread(filename); %Import CSV vector with the mean of each run

sampleMean=mean(meansVector); %Mean

sampleVariance=0; %Variance
for i=1:m
    sampleVariance=(meansVector(i)-sampleMean)^2+sampleVariance;
end
sampleVariance=sampleVariance/(m-1);

deviation=sqrt(sampleVariance); %Deviation

mu = 0; %Normal Distribution
sigma = 1;
y=1-alfa;
Z=icdf('Normal',y,mu,sigma); 

CI=[sampleMean-Z*deviation/sqrt(m),sampleMean+Z*deviation/sqrt(m)]

csvwrite(strcat(filename(1:end-4),'CI.dat'),CI) %Remove .CSV from filename and add .dat
end
