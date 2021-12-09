function [c, t, o, i, d] = Animation(R)    
    axis equal
    grid off
    axis([-13*R 13*R -13*R 13*R 0 13*R]);
    
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    
    hold on
    
    % angle of view
    view(0,90);
    
    c = Cube(R);
    t = Tetrahedron(R);
    o = Octahedron(R);
    i = Icosahedron(R);
    d = Dodecahedron(R);
    
    N=800;
    for n=1:N
        c = c.reset();
        t = t.reset();
        o = o.reset();
        i = i.reset();
        d = d.reset();
    
        if n<=50 % separation of the planifications
            c = c.translate(-6*R, -6*R, 0, n/50);
            d = d.translate(6*R, -6*R, 0, n/50);
            o = o.translate(-6*R, 6*R, 0, n/50);
            i = i.translate(6*R, 6*R, 0, n/50);
    
        elseif n<=100 % build planifications
            c = c.planificate((n-50)/50);
            t = t.planificate((n-50)/50);
            o = o.planificate((n-50)/50);
            i = i.planificate((n-50)/50);
            d = d.planificate((n-50)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=140 %101-140
            % angle of view
            view((n-100)/40 * -37.5, 30 + 60*(140-n)/40);
    
            c = c.planificate(1);
            t = t.planificate(1);
            o = o.planificate(1);
            i = i.planificate(1);
            d = d.planificate(1);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
    
        elseif n<=220 % close planifications
            view(-37.5, 30)
            c = c.close((n-140)/80);
            t = t.close((n-140)/80);
            o = o.close((n-140)/80);
            i = i.close((n-140)/80);
            d = d.close((n-140)/80);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
    
        elseif n<=270 % spin solids
            c = c.close(1);
            t = t.close(1);
            o = o.close(1);
            i = i.close(1);
            d = d.close(1);
    
            c = c.rotateAroundItself((n-220)/50);
            t = t.rotateAroundItself((n-220)/50);
            o = o.rotateAroundItself((n-220)/50);
            i = i.rotateAroundItself((n-220)/50);
            d = d.rotateAroundItself((n-220)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=350 % open planifications
            c = c.close((350-n)/80);
            t = t.close((350-n)/80);
            o = o.close((350-n)/80);
            i = i.close((350-n)/80);
            d = d.close((350-n)/80);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=400 % destroy planifications
            c = c.planificate((400-n)/50);
            t = t.planificate((400-n)/50);
            o = o.planificate((400-n)/50);
            i = i.planificate((400-n)/50);
            d = d.planificate((400-n)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=450 % build planifications while spinning
            c = c.planificate((n-400)/50);
            t = t.planificate((n-400)/50);
            o = o.planificate((n-400)/50);
            i = i.planificate((n-400)/50);
            d = d.planificate((n-400)/50);
    
            c = c.rotateAroundItself((n-400)/50);
            t = t.rotateAroundItself((n-400)/50);
            o = o.rotateAroundItself((n-400)/50);
            i = i.rotateAroundItself((n-400)/50);
            d = d.rotateAroundItself((n-400)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
    
        elseif n<=550 % close planifications while spinning
            c = c.close((n-450)/100);
            t = t.close((n-450)/100);
            o = o.close((n-450)/100);
            i = i.close((n-450)/100);
            d = d.close((n-450)/100);
    
            c = c.rotateAroundItself((n-450)/50);
            t = t.rotateAroundItself((n-450)/50);
            o = o.rotateAroundItself((n-450)/50);
            i = i.rotateAroundItself((n-450)/50);
            d = d.rotateAroundItself((n-450)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
    
        elseif n<=600 % keep spinning
            c = c.close(1);
            t = t.close(1);
            o = o.close(1);
            i = i.close(1);
            d = d.close(1);
    
            c = c.rotateAroundItself((n-550)/50);
            t = t.rotateAroundItself((n-550)/50);
            o = o.rotateAroundItself((n-550)/50);
            i = i.rotateAroundItself((n-550)/50);
            d = d.rotateAroundItself((n-550)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=700 % open planifications
            c = c.close((700-n)/100);
            t = t.close((700-n)/100);
            o = o.close((700-n)/100);
            i = i.close((700-n)/100);
            d = d.close((700-n)/100);
    
            c = c.rotateAroundItself((n-600)/50);
            t = t.rotateAroundItself((n-600)/50);
            o = o.rotateAroundItself((n-600)/50);
            i = i.rotateAroundItself((n-600)/50);
            d = d.rotateAroundItself((n-600)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
        
        elseif n<=750 % destroy planifications
            c = c.planificate((750-n)/50);
            t = t.planificate((750-n)/50);
            o = o.planificate((750-n)/50);
            i = i.planificate((750-n)/50);
            d = d.planificate((750-n)/50);
    
            c = c.rotateAroundItself((n-700)/50);
            t = t.rotateAroundItself((n-700)/50);
            o = o.rotateAroundItself((n-700)/50);
            i = i.rotateAroundItself((n-700)/50);
            d = d.rotateAroundItself((n-700)/50);
    
            c = c.translate(-6*R, -6*R, 0, 1);
            d = d.translate(6*R, -6*R, 0, 1);
            o = o.translate(-6*R, 6*R, 0, 1);
            i = i.translate(6*R, 6*R, 0, 1);
    
        else % go back to center
            c = c.translate(-6*R, -6*R, 0, (800-n)/50);
            d = d.translate(6*R, -6*R, 0, (800-n)/50);
            o = o.translate(-6*R, 6*R, 0, (800-n)/50);
            i = i.translate(6*R, 6*R, 0, (800-n)/50);
        end
    
        c = c.update();
        t = t.update();
        o = o.update();
        i = i.update();
        d = d.update();
        pause(0.02)
    end

end

