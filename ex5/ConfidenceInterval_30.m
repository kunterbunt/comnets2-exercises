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


M11 = csvread('export-11.csv');
values11=M11(:,2);
plot(values11,'b')
mean11=mean(values11);

hold on

M12 = csvread('export-12.csv');
values12=M12(:,2);
plot(values12,'g--')
mean12=mean(values12);

hold on

M13 = csvread('export-13.csv');
values13=M13(:,2);
plot(values13,'r--')
mean13=mean(values13);

hold on

M14 = csvread('export-14.csv');
values14=M14(:,2);
plot(values14,'y--')
mean14=mean(values14);

hold on

M15 = csvread('export-15.csv');
values15=M15(:,2);
plot(values15,'o--')
mean15=mean(values15);

hold on

M16 = csvread('export-16.csv');
values16=M16(:,2);
plot(values16,'m--')
mean16=mean(values16);

hold on

M17 = csvread('export-17.csv');
values17=M17(:,2);
plot(values17,'d--')
mean17=mean(values17);

hold on

M18 = csvread('export-18.csv');
values18=M18(:,2);
plot(values18,'or--')
mean18=mean(values18);

hold on

M19 = csvread('export-19.csv');
values19=M19(:,2);
plot(values19,'b--')
mean19=mean(values19);

hold on

M20 = csvread('export-20.csv');
values20=M20(:,2);
plot(values20,'c--')
mean20=mean(values20);



M21 = csvread('export-21.csv');
values21=M21(:,2);
plot(values21,'b')
mean21=mean(values21);

hold on

M22 = csvread('export-22.csv');
values22=M22(:,2);
plot(values22,'g--')
mean22=mean(values22);

hold on

M23 = csvread('export-23.csv');
values23=M23(:,2);
plot(values23,'r--')
mean23=mean(values23);

hold on

M24 = csvread('export-24.csv');
values24=M24(:,2);
plot(values24,'y--')
mean24=mean(values24);

hold on

M25 = csvread('export-25.csv');
values25=M25(:,2);
plot(values25,'o--')
mean25=mean(values25);

hold on

M26 = csvread('export-26.csv');
values26=M26(:,2);
plot(values26,'m--')
mean26=mean(values26);

hold on

M27 = csvread('export-27.csv');
values27=M27(:,2);
plot(values27,'d--')
mean27=mean(values27);

hold on

M28 = csvread('export-28.csv');
values28=M28(:,2);
plot(values28,'or--')
mean28=mean(values28);

hold on

M29 = csvread('export-29.csv');
values29=M29(:,2);
plot(values29,'b--')
mean29=mean(values29);

hold on

M30 = csvread('export-30.csv');
values30=M30(:,2);
plot(values30,'c--')
mean30=mean(values30);

xlabel('Time');
ylabel('Server Input Throughput [bits/sec]');


%Calculate CI
sampleMeanVector = [mean1,mean2,mean3,mean4,mean5,mean6,mean7,mean8,mean9,mean10,mean11,mean12,mean13,mean14,mean15,mean16,mean17,mean18,mean19,mean20,mean21,mean22,mean23,mean24,mean25,mean26,mean27,mean28,mean29,mean30];
sampleMean=mean(sampleMeanVector);
m=30; %Number of samples

sampleVariance=0;
for i=1:m
    sampleVariance=(sampleMeanVector(i)-sampleMean)^2+sampleVariance;
end
sampleVariance=sampleVariance/(m-1);
deviation=sqrt(sampleVariance);

mu = 0;
sigma = 1;
y=1-alfa;
Z=icdf('Normal',y,mu,sigma);

CI=[sampleMean-Z*deviation/sqrt(m),sampleMean+Z*deviation/sqrt(m)]


