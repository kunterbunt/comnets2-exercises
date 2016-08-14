%1.Create files from .csv.
get_CI('TenStudentsNOCCTV.csv',20,0.05)
get_CI('TwentyFiveStudentsNOCCTV.csv',20,0.05)
get_CI('FiftyStudents.csv',20,0.05)
get_CI('HundredStudents.csv',20,0.05)


%2. Load all CI
file1 = load('TenStudentsNOCCTVCI.dat');
file2 = load('TwentyFiveStudentsNOCCTVCI.dat');
file3 = load('FiftyStudentsNOCCTV.dat');
file4 = load('HundredStudentsNOCCTV.dat');

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


set(gca,'XTickLabel',{'10 Students', '25 Students', '50 Students', '100 Students'})
ylabel('Error Rate [%]');
