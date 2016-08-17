%1.Create files from .csv.
get_CI('New-ThirtyFiveStudentsNOCCTV.csv',20,0.05)
get_CI('New-FourtyFiveStudentsNOCCTV.csv',20,0.05)
get_CI('New-FiftyFiveStudentsNOCCTV.csv',20,0.05)
get_CI('New-SixtyFiveStudentsNOCCTV.csv',20,0.05)


%2. Load all CI
file1 = load('New-ThirtyFiveStudentsNOCCTVCI.dat');
file2 = load('New-FourtyFiveStudentsNOCCTVCI.dat');
file3 = load('New-FiftyFiveStudentsNOCCTVCI.dat');
file4 = load('New-SixtyFiveStudentsNOCCTVCI.dat');

%3. Scale to %
file1=100.*file1;
file2=100.*file2;
file3=100.*file3;
file4=100.*file4;

%4. Plot all CI
y=[file1; file2; file3; file4];
transY=transpose(y);

meanY=mean(transY);
x=1:1:length(meanY);

varianceY=transY(2,:)-meanY(1,:);

bar(meanY)
hold on
errorbar(x,meanY,varianceY,'rx')

set(gca,'XTickLabel',{'35 Students', '45 Students', '55 Students', '65 Students'})
ylabel('Error Rate [%]');
title('NO CCTV')