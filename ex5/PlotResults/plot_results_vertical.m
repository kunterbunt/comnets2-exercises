%Import results from first code and plot it:
tenruns = load('tenrunsCI.dat');
hundredruns = load('hundredrunsCI.dat');
thousendruns = load('thousendrunsCI.dat');
thirtyruns = load('thirtyrunsCI.dat');


y=[tenruns; thirtyruns; hundredruns; thousendruns];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);
varianceY=transY(2,:)-meanY(1,:);

bar(meanY)
hold on
errorbar(x,meanY,varianceY,'rx')


set(gca,'XTickLabel',{'10sec 10 runs', '10 sec 30 runs', '100 sec 10 runs', '1000sec 10 runs'})
ylabel('Throughput [bits/sec]');
%legend('10 sec 10 runs','100 sec 10 runs','1000sec 10runs','10 sec 30 runs');
