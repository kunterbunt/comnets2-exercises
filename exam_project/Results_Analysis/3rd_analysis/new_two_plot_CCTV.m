%1.Create files from .csv.
get_CI('new-two-ThirtyfiveStudents.csv',20,0.05)
get_CI('new-two-FortyfiveStudents.csv',20,0.05)
get_CI('new-two-FiftyfiveStudents.csv',20,0.05)
get_CI('new-two-SixtyfiveStudents.csv',20,0.05)


%2. Load all CI
file1 = load('new-two-ThirtyfiveStudentsCI.dat');
file2 = load('new-two-FortyfiveStudentsCI.dat');
file3 = load('new-two-FiftyfiveStudentsCI.dat');
file4 = load('new-two-SixtyfiveStudentsCI.dat');

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