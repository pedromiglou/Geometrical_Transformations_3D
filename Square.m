classdef Square
    % Class to represent the Square figure
    
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
            size = 3;
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
        
        function obj = translate(obj, X, Y, Z)
            % Translation movement
            T = [ 1 0 0 X
                  0 1 0 Y
                  0 0 1 Z
                  0 0 0 1
                ];
            obj.Points = T*obj.Points;
                
            obj.h.XData = obj.Points(1,:);
            obj.h.YData = obj.Points(2,:);
            obj.h.ZData = obj.Points(3,:);
        end

        function [obj, dependentFaces] = rotate(obj, otherPoints, angle, dependentFaces)
            % Rotation movement
            commonPoints = intersect(otherPoints', obj.Points', 'rows')';
            axis = commonPoints(:,1) - commonPoints(:,2);
            axis = axis/sqrt(sum(axis.^2));

            R = [
                cos(angle) + axis(1).^2*(1-cos(angle))    axis(1)*axis(2)*(1-cos(angle)) - axis(3) * sin(angle)    axis(1)*axis(3)*(1-cos(angle))+axis(2)*sin(angle) 0
                axis(2)*axis(1)*(1-cos(angle))+axis(3)*sin(angle)    cos(angle)+axis(2).^2*(1-cos(angle))    axis(2)*axis(3)*(1-cos(angle))-axis(1)*sin(angle) 0
                axis(3)*axis(1)*(1-cos(angle))-axis(2)*sin(angle)    axis(3)*axis(2)*(1-cos(angle))+axis(1)*sin(angle)    cos(angle) + axis(3).^2*(1-cos(angle)) 0
                0 0 0 1
            ];

            obj.Points = trans(- commonPoints(1,1), - commonPoints(2,1), - commonPoints(3,1))*obj.Points;
            obj.Points = R*obj.Points;
            obj.Points = trans( commonPoints(1,1),  commonPoints(2,1),  commonPoints(3,1))*obj.Points;

            obj.h.XData = obj.Points(1,:);
            obj.h.YData = obj.Points(2,:);
            obj.h.ZData = obj.Points(3,:);

            i = 1;
            while i<=length(dependentFaces)
                dependentFaces(i).Points = trans(- commonPoints(1,1), - commonPoints(2,1), - commonPoints(3,1))*dependentFaces(i).Points;
                dependentFaces(i).Points = R*dependentFaces(i).Points;
                dependentFaces(i).Points = trans( commonPoints(1,1),  commonPoints(2,1),  commonPoints(3,1))*dependentFaces(i).Points;
    
                dependentFaces(i).h.XData = dependentFaces(i).Points(1,:);
                dependentFaces(i).h.YData = dependentFaces(i).Points(2,:);
                dependentFaces(i).h.ZData = dependentFaces(i).Points(3,:);
                i = i+1;
            end
        end

        function obj = copy(obj)
        end
    end
end

