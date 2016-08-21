%1.Create files from .csv.
get_CI('delay-ThirtyfiveStudents.csv',20,0.05)
get_CI('delay-FortyfiveStudents.csv',20,0.05)
get_CI('delay-FiftyfiveStudents.csv',20,0.05)
get_CI('delay-SixtyfiveStudents.csv',20,0.05)


%2. Load all CI
file1 = load('delay-ThirtyfiveStudentsCI.dat');
file2 = load('delay-FortyfiveStudentsCI.dat');
file3 = load('delay-FiftyfiveStudentsCI.dat');
file4 = load('delay-SixtyfiveStudentsCI.dat');

%3. Scale to %
file1=1000.*file1;
file2=1000.*file2;
file3=1000.*file3;
file4=1000.*file4;

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
ylabel('Delay [ms]');
title('Delay with CCTV')