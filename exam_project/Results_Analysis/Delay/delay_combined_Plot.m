%1. Load all CI
file1 = load('delay-ThirtyfiveStudentsCI.dat');
file2 = load('delay-FortyfiveStudentsCI.dat');
file3 = load('delay-FiftyfiveStudentsCI.dat');
file4 = load('delay-SixtyfiveStudentsCI.dat');

%2. Scale to %
file1=1000.*file1;
file2=1000.*file2;
file3=1000.*file3;
file4=1000.*file4;

%3. Convert to mean + variance
y=[file1; file2; file3; file4];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);

varianceY=transY(2,:)-meanY(1,:);

%NO CCTV****************************

%1. Load all CI
file1 = load('delay-ThirtyfiveStudentsNOCCTVCI.dat');
file2 = load('delay-FortyfiveStudentsNOCCTVCI.dat');
file3 = load('delay-FiftyfiveStudentsNOCCTVCI.dat');
file4 = load('delay-SixtyfiveStudentsNOCCTVCI.dat');

%2. Scale to %
file1=1000.*file1;
file2=1000.*file2;
file3=1000.*file3;
file4=1000.*file4;

%3. Convert to mean + variance
y=[file1; file2; file3; file4];
transY1=transpose(y);

meanY1=mean(transY1);
x=1:1:length(meanY);

varianceY1=transY1(2,:)-meanY1(1,:);


%PLOT combined graph with CI**********************
figure
bar(meanY, 'y')
hold on
errorbar(x,meanY,varianceY,'rx')

bar(meanY1,'b')
hold on
errorbar(x,meanY1,varianceY1,'gx')

ylabel('Delay [ms]');
title('CCTV vs Non CCTV')
set(gca,'XTickLabel',{'35 Students', '45 Students', '55 Students', '65 Students'})

set(gca,'FontSize', 32);
legend('CCTV on', '', 'CCTV off', 'Location', 'northwest');
%axis([0.5 4.5 0 15])


