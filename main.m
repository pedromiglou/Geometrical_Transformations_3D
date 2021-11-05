addpath ./Geometrical_Transformations_3D

R = 3;

close

plot3(0,0,0,'b');

axis equal
grid on
axis([0 30 0 30 0 30]);

xlabel('X')
ylabel('Y')
zlabel('Z')

hold on

s = Octahedron(R);

N=50;
for n=1:N
    s = s.close(N);
    pause(0.02)
end
