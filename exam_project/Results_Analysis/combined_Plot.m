%1. Load all CI
file1 = load('TenStudentsCI.dat');
file2 = load('TwentyFiveStudentsCI.dat');
file3 = load('FiftyStudentsCI.dat');
file4 = load('HundredStudentsCI.dat');

%2. Scale to %
file1=100.*file1;
file2=100.*file2;
file3=100.*file3;
file4=100.*file4;

%3. Convert to mean + variance
y=[file1; file2; file3; file4];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);

varianceY=transY(2,:)-meanY(1,:);

%NO CCTV****************************

%1. Load all CI
file1 = load('TenStudentsNOCCTVCI.dat');
file2 = load('TwentyFiveStudentsNOCCTVCI.dat');
file3 = load('FiftyStudentsNOCCTVCI.dat');
file4 = load('HundredStudentsNOCCTVCI.dat');

%2. Scale to %
file1=100.*file1;
file2=100.*file2;
file3=100.*file3;
file4=100.*file4;

%3. Convert to mean + variance
y=[file1; file2; file3; file4];
transY1=transpose(y);

meanY1=mean(transY1);
x=1:1:length(meanY);

varianceY1=transY1(2,:)-meanY1(1,:);


%PLOT combined graph without CI**********************
ymean = [meanY1(1), meanY(1); meanY1(2), meanY(2); meanY1(3), meanY(3); meanY1(4), meanY(4)];
bar(ymean)
hold on
ylabel('Error Rate [%]');
title('CCTV vs Non CCTV')
set(gca,'XTickLabel',{'10 Students', '25 Students', '50 Students', '100 Students'})
%PLOT combined graph with CI**********************
figure
bar(meanY, 'y')
hold on
errorbar(x,meanY,varianceY,'rx')

bar(meanY1,'b')
hold on
errorbar(x,meanY1,varianceY1,'gx')

ylabel('Error Rate [%]');
title('CCTV vs Non CCTV')
set(gca,'XTickLabel',{'10 Students', '25 Students', '50 Students', '100 Students'})
