classdef Square
    %UNTITLED Summary of this class goes here
    
    properties
        Points
        X
        Y
        Z
        Phi
        Th
        Psi
        h
        size
    end
    
    methods
        function obj = Square(size,X, Y, Z, Phi, Th, Psi)
            % Construct an instance of this class
            size = sqrt(2)*size;
            obj.X = size*X;
            obj.Y = size*Y;
            obj.Z = size*Z;
            obj.Phi = Phi;
            obj.Th = Th;
            obj.Psi = Psi;
            obj.size = size;

            obj.Points = [
                -size -size  0  0
                 0 -size -size  0
                 0  0  0  0
                 1  1  1  1
                ];

            obj.Points = trans(obj.X, obj.Y, obj.Z)*rotx(obj.Phi)*roty(obj.Th)*rotz(obj.Psi)*obj.Points;
            
            obj.h = fill3( obj.Points(1, :), obj.Points(2,:), obj.Points(3,:), 'm');
        end
        
        function obj = move(obj, path)
            % Move square
            %{
            N = 100;
            A1 = [
                -2 -2  0  0
                 0 -2 -2  0
                 0  0  0  0
                 1  1  1  1
                ];

            obj.Points = Animate(obj.h,A1,obj.Points,path,N);
            %}
            obj.Points = trans(path(1)*obj.size, path(2)*obj.size, path(3)*obj.size)*rotx(path(4))*roty(path(5))*rotz(path(6))*obj.Points;
            
            obj.h.XData = obj.Points(1,:);
            obj.h.YData = obj.Points(2,:);
            obj.h.ZData = obj.Points(3,:);
        end
    end
end

