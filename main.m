addpath ./Geometrical_Transformations_3D

R = 4;

close

plot3(0,0,0,'b');

axis equal
grid on
axis([-40 40 -40 40 -40 40]);

xlabel('X')
ylabel('Y')
zlabel('Z')

hold on

c = Cube(R);
t = Tetrahedron(R);
o = Octahedron(R);
i = Icosahedron(R);
d = Dodecahedron(R);

N=200;
for n=1:N
    c = c.reset();
    t = t.reset();
    o = o.reset();
    i = i.reset();
    d = d.reset();

    if n<50
        c = c.translate(-20*n/50, -20*n/50, 0);
        t = t.translate(20*n/50, -20*n/50, 0);
        o = o.translate(-20*n/50, 20*n/50, 0);
        i = i.translate(20*n/50, 20*n/50, 0);
    else
        if n<100
            c = c.planificate(n-50, 50);
            t = t.planificate(n-50, 50);
            o = o.planificate(n-50, 50);
            i = i.planificate(n-50, 50);
            d = d.planificate(n-50, 50);
        else
            c = c.close(n-100, 100);
            t = t.close(n-100, 100);
            o = o.close(n-100, 100);
            i = i.close(n-100, 100);
            d = d.close(n-100, 100);
        end

        c = c.translate(-20, -20, 0);
        t = t.translate(20, -20, 0);
        o = o.translate(-20, 20, 0);
        i = i.translate(20, 20, 0);
    end

    c = c.update();
    t = t.update();
    o = o.update();
    i = i.update();
    d = d.update();
    pause(0.02)
end
