addpath ./Geometrical_Transformations_3D

R = 3;

close

plot3(0,0,0,'b');

axis equal
grid on
axis([-10 20 -10 20 -10 20]);

xlabel('X')
ylabel('Y')
zlabel('Z')

hold on

s = Octahedron(R);

N=100;
for n=1:N
    s = s.reset();

    if n<50
        s = s.planificate(n, 50);
    else
        s = s.close(n-50, 50);
    end

    s = s.update();
    pause(0.02)
end
