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
for m = 250:250:1000
   avgs=zeros(1, ceil(length(x1) / m));
    j = 1;
    for i=0:m:length(x1)-1
        from = i + 1;
        to = min(i + m, length(x1));
        avgs(j) = mean(x1(from:to));
        j = j + 1;
    end
    variances = [variances, var(avgs)];
    var(avgs)
    m
end
bar(variances./variances(1));
set(gca,'Xtick',1:4,'XTickLabel',{'m=250','m=500', 'm=750', 'm=1000'})
ylabel('Throughput variance relative to m=250');
hold off