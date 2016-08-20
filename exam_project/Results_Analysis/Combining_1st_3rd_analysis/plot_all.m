%1. Load all CI
file1 = load('TenStudentsCI.dat');
file2 = load('TwentyFiveStudentsCI.dat');
file3 = load('new-two-ThirtyfiveStudentsCI.dat');
file4 = load('new-two-FortyfiveStudentsCI.dat');
file5 = load('FiftyStudentsCI.dat');
file6 = load('new-two-FiftyfiveStudentsCI.dat');
file7 = load('new-two-SixtyfiveStudentsCI.dat');
file8 = load('HundredStudentsCI.dat');


%2. Scale to %
file1=100.*file1;
file2=100.*file2;
file3=100.*file3;
file4=100.*file4;
file5=100.*file5;
file6=100.*file6;
file7=100.*file7;
file8=100.*file8;

%3. Convert to mean + variance
y=[file1; file2; file3; file4; file5; file6; file7; file8];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);

varianceY=transY(2,:)-meanY(1,:);

%NO CCTV****************************

%1. Load all CI
file1 = load('TenStudentsNOCCTVCI.dat');
file2 = load('TwentyFiveStudentsNOCCTVCI.dat');
file3 = load('new-two-ThirtyfiveStudentsNOCCTVCI.dat');
file4 = load('new-two-FortyfiveStudentsNOCCTVCI.dat');
file5 = load('FiftyStudentsNOCCTVCI.dat');
file6 = load('new-two-FiftyfiveStudentsNOCCTVCI.dat');
file7 = load('new-two-SixtyfiveStudentsNOCCTVCI.dat');
file8 = load('HundredStudentsNOCCTVCI.dat');

%2. Scale to %
file1=100.*file1;
file2=100.*file2;
file3=100.*file3;
file4=100.*file4;
file5=100.*file5;
file6=100.*file6;
file7=100.*file7;
file8=100.*file8;

%3. Convert to mean + variance
y=[file1; file2; file3; file4; file5; file6; file7; file8];
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

ylabel('Error Rate [%]');
title('CCTV vs Non CCTV')
set(gca,'XTickLabel',{'10', '25', '35', '45','50', '55', '65', '100'})
xlabel('Students')
set(gca,'FontSize',28);
legend('CCTV on', '', 'CCTV off', 'Location', 'northwest');
axis([0.5 9 0 15])


%Set threshold
hold on 
Z1=-5:1:5;
y2=ones(length(Z1));
y2=y2.*5;
plot(Z1,y2)
