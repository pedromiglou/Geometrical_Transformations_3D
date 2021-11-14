addpath ./Geometrical_Transformations_3D

R = 3;

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

N=450;
for n=1:N
    c = c.reset();
    t = t.reset();
    o = o.reset();
    i = i.reset();
    d = d.reset();

    if n<50 % separation of the planifications
        c = c.translate(-20, -20, 0, n, 50);
        t = t.translate(20, -20, 0, n, 50);
        o = o.translate(-20, 20, 0, n, 50);
        i = i.translate(20, 20, 0, n, 50);

    elseif n<100 % build planifications
        c = c.planificate(n-50, 50);
        t = t.planificate(n-50, 50);
        o = o.planificate(n-50, 50);
        i = i.planificate(n-50, 50);
        d = d.planificate(n-50, 50);

        c = c.translate(-20, -20, 0, 50, 50);
        t = t.translate(20, -20, 0, 50, 50);
        o = o.translate(-20, 20, 0, 50, 50);
        i = i.translate(20, 20, 0, 50, 50);

    elseif n<200 % close planifications
        c = c.close(n-100, 100);
        t = t.close(n-100, 100);
        o = o.close(n-100, 100);
        i = i.close(n-100, 100);
        d = d.close(n-100, 100);

        c = c.translate(-20, -20, 0, 50, 50);
        t = t.translate(20, -20, 0, 50, 50);
        o = o.translate(-20, 20, 0, 50, 50);
        i = i.translate(20, 20, 0, 50, 50);

    elseif n<250 % spin solids
        c = c.close(100, 100);
        t = t.close(100, 100);
        o = o.close(100, 100);
        i = i.close(100, 100);
        d = d.close(100, 100);

        c = c.rotateAroundItself(n-200, 50);
        t = t.rotateAroundItself(n-200, 50);
        o = o.rotateAroundItself(n-200, 50);
        i = i.rotateAroundItself(n-200, 50);
        d = d.rotateAroundItself(n-200, 50);

        c = c.translate(-20, -20, 0, 50, 50);
        t = t.translate(20, -20, 0, 50, 50);
        o = o.translate(-20, 20, 0, 50, 50);
        i = i.translate(20, 20, 0, 50, 50);
    
    elseif n<=350 % open planifications
        c = c.close(350-n, 100);
        t = t.close(350-n, 100);
        o = o.close(350-n, 100);
        i = i.close(350-n, 100);
        d = d.close(350-n, 100);

        c = c.translate(-20, -20, 0, 50, 50);
        t = t.translate(20, -20, 0, 50, 50);
        o = o.translate(-20, 20, 0, 50, 50);
        i = i.translate(20, 20, 0, 50, 50);
    
    elseif n<400 % build planifications
        c = c.planificate(400-n, 50);
        t = t.planificate(400-n, 50);
        o = o.planificate(400-n, 50);
        i = i.planificate(400-n, 50);
        d = d.planificate(400-n, 50);

        c = c.translate(-20, -20, 0, 50, 50);
        t = t.translate(20, -20, 0, 50, 50);
        o = o.translate(-20, 20, 0, 50, 50);
        i = i.translate(20, 20, 0, 50, 50);

    else % go back to center
        c = c.translate(-20, -20, 0, 450-n, 50);
        t = t.translate(20, -20, 0, 450-n, 50);
        o = o.translate(-20, 20, 0, 450-n, 50);
        i = i.translate(20, 20, 0, 450-n, 50);
    end

    c = c.update();
    t = t.update();
    o = o.update();
    i = i.update();
    d = d.update();
    pause(0.02)
end
