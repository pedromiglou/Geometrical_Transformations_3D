addpath ./Geometrical_Transformations_3D

R = 2;

close

plot3(0,0,0,'b');

axis equal
grid on
axis([0 20 0 20 0 20]);

xlabel('X')
ylabel('Y')
zlabel('Z')

hold on

s = Cube(R );
s = s.close();
s = s.translate(2,2,0);
