%Import csv of 1 long simulation (5000sec) to see a reasonable simulation 
%time wich is enough:
%Conclusion: With around 300sec is enough.
clear
%Import 1 vector simulation
M1 = csvread('vector.csv');
x1=M1(:,2);
figure
set(gca,'FontSize',28)
hold on
plot(x1, 'b');

%Plot this user mean:
average=mean(x1);
x=ones(1,length(x1));
x=x.*average;
plot(x, 'r');
hold off

%Plot all users mean:
xlabel('Time [s]');
ylabel('Lecture livestreaming throughput [bits/sec]');

figure
hold on
set(gca,'FontSize',28)
variances = [];
m = [250; 350; 500; 750; 1000]
for m1 = 1:length(m)
   avgs=zeros(1, ceil(length(x1) / m(m1)));
    j = 1;
    for i=0:m(m1):length(x1)-1
        from = i + 1;
        to = min(i + m(m1), length(x1));
        avgs(j) = mean(x1(from:to));
        j = j + 1;
    end
    variances = [variances, var(avgs)];    
end
bar(variances./variances(1));
set(gca,'Xtick',1:5,'XTickLabel',{'t=250s','t=350s', 't=500s', 't=750s', 't=1000s'})
ylabel('Throughput variance relative to t=250');
hold off