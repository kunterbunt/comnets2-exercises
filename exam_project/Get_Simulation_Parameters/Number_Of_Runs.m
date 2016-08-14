%To calculate the confidence it depends on 1/sqrt(n? of runs), taking a
%look at the following graph we can see that the higher effort of going
%from 20 runs to 30 runs doesn't get much more benefit like going from 10
%to 20.
x=1:1:100;
y=1./(sqrt(x));
plot(x,y,'--')
xlabel('x');
ylabel('1/sqrt(x)');

z=ones(size(x));
z=1/sqrt(5).*z;
a=ones(size(x));
a=1/sqrt(10).*a;
b=ones(size(x));
b=1/sqrt(20).*b;
c=ones(size(x));
c=1/sqrt(30).*c;

hold on
plot(z, 'y')
plot(a, 'r')
plot(b, 'g')
plot(c, 'b')
legend('1/sqrt(x)','1/(sqrt(5)','1/(sqrt(10)','1/(sqrt(20)','1/(sqrt(30)')