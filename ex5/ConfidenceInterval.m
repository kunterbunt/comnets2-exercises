%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%1. Create analysis file.
%%%2. Open .anf file.
%%%3. Go to Input wildcard, .vec, .sca, then browse Data.
%%%4. Select Ex5Network.server.ppp[0].inputHook[0] and thruput (bit/sec).
%%%5. Select al files, right click, export, csv.
%%%6. Write as name export, scalar groups unchecked, precision 18,
%%%separator "COMMA", line ends "cr lf" , text delimiter """, add header to
%%%columns unchecked.
%%%7. Run CI.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


alfa=0.05;

%Import and plot values


M1 = csvread('export-1.csv');
values1=M1(:,2);
plot(values1,'b')
mean1=mean(values1);

hold on

M2 = csvread('export-2.csv');
values2=M2(:,2);
plot(values2,'g--')
mean2=mean(values2);

hold on

M3 = csvread('export-3.csv');
values3=M3(:,2);
plot(values3,'r--')
mean3=mean(values3);

hold on

M4 = csvread('export-4.csv');
values4=M4(:,2);
plot(values4,'y--')
mean4=mean(values4);

hold on

M5 = csvread('export-5.csv');
values5=M5(:,2);
plot(values5,'o--')
mean5=mean(values5);

hold on

M6 = csvread('export-6.csv');
values6=M6(:,2);
plot(values6,'m--')
mean6=mean(values6);

hold on

M7 = csvread('export-7.csv');
values7=M7(:,2);
plot(values7,'d--')
mean7=mean(values7);

hold on

M8 = csvread('export-8.csv');
values8=M8(:,2);
plot(values8,'or--')
mean8=mean(values8);

hold on

M9 = csvread('export-9.csv');
values9=M9(:,2);
plot(values9,'b--')
mean9=mean(values9);

hold on

M10 = csvread('export-10.csv');
values10=M10(:,2);
plot(values10,'c--')
mean10=mean(values10);

xlabel('Time');
ylabel('Server Input Throughput [bits/sec]');


%Calculate CI
sampleMeanVector = [mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10];
sampleMean=mean(sampleMeanVector);
m=10; %Number of samples

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


