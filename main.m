addpath ./lib
addpath ./TP1

R = 2;

close

plot3(0,0,0,'b');

axis equal
grid on
axis([-10 10 -10 10 -10 10]);

xlabel('X')
ylabel('Y')
zlabel('Z')

line([-10 10], [0 0], [0 0]);
line([0 0], [-10 10], [0 0]);
line([0 0], [0 0], [-10 10]);

hold on

s = Cube(R );

%s.moveSlowly([5, 0,0,pi/2,0,0]);
s.close();
%{
path = [
        0 5 0 0 0 0
        0 0 0 pi/2 0 pi/2
        0 0 0 pi/2 0 0
        0 0 0 pi/2 0 0
        0 0 0 pi/2 0 0
        0 0 0 pi/2 0 0
    ];

pInicial = eye(4);
pInicial(1,4) = 6;

N = 100;

for n=1:size(path,1)
    D = path(n,:);
    pFinal = Animate(h1,A1,pInicial,D,N);
    pInicial = pFinal;
end
%}