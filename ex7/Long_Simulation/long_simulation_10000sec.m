%Import csv of 1 long simulation (10000sec) to see a reasonable simulation 
%time wich is enough:
%Conclusion: With around 1000sec is enough.
clear
%Import 1 vector simulation
M1 = csvread('long_simulation.csv');
x1=M1(:,2);
plot(x1, 'b');

%Plot this user mean:
average=mean(x1);
x=ones(1,length(x1));
x=x.*average;
hold on
plot(x, 'r');

%Plot all users mean:
M3 = csvread('avg_throug_long_simulation-1.csv');
average=mean(M3);
x2=ones(1,length(x1));
x2=x2.*average;
hold on
plot(x2, 'g');


xlabel('Time');
ylabel('User Throughput [bits/sec]');