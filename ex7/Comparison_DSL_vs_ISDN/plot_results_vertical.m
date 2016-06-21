%Import results from CI and plot it:
file1 = load('ConfidenceInterval10runs_1000sec_ISDN.dat');
file2 = load('ConfidenceInterval10runs_1000sec_DSL.dat');



y=[file1; file2];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);
varianceY=transY(2,:)-meanY(1,:);

bar(meanY)
hold on
errorbar(x,meanY,varianceY,'rx')


set(gca,'XTickLabel',{'ISDN', 'DSL'})
ylabel('Throughput [bits/sec]');
