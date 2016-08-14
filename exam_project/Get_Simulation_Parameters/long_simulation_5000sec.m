%Import csv of 1 long simulation (5000sec) to see a reasonable simulation 
%time wich is enough:
%Conclusion: With around 300sec is enough.
clear
%Import 1 vector simulation
M1 = csvread('vector.csv');
x1=M1(:,2);
plot(x1, 'b');

%Plot this user mean:
average=mean(x1);
x=ones(1,length(x1));
x=x.*average;
hold on
plot(x, 'r');

%Plot all users mean:


xlabel('Time');
ylabel('Professor Throughput [bits/sec]');