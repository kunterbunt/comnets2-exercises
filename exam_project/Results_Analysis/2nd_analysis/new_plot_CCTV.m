%1.Create files from .csv.
get_CI('New-ThirtyFiveStudents.csv',20,0.05)
get_CI('New-FourtyFiveStudents.csv',20,0.05)
get_CI('New-FiftyFiveStudents.csv',20,0.05)
get_CI('New-SixtyFiveStudents.csv',20,0.05)


%2. Load all CI
file1 = load('New-ThirtyFiveStudentsCI.dat');
file2 = load('New-FourtyFiveStudentsCI.dat');
file3 = load('New-FiftyFiveStudentsCI.dat');
file4 = load('New-SixtyFiveStudentsCI.dat');

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
title('CCTV')