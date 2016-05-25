tenruns = load('tenrunsCI.dat');
hundredruns = load('hundredrunsCI.dat');
thousendruns = load('thousendrunsCI.dat');
thirtyruns = load('thirtyrunsCI.dat');


plot(tenruns,'b')
hold on
plot(hundredruns,'g')
hold on
plot(thousendruns,'r')
hold on
plot(thirtyruns,'c')

%xlabel('');
ylabel('Confidence Interval');
legend('10 sec 10 runs','100 sec 10 runs','1000sec 10runs','10 sec 30 runs');
