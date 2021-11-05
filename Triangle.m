classdef Triangle
    % Class to represent the Triangle figure
    
    properties
        Points
        h
        size
    end
    
    methods
        function obj = Triangle(size, color)
            % Construct an instance of this class
            obj.size = sqrt(3*sqrt(3)/2)*size;

            V = [
                1/2       -1/2      0
                sqrt(3)/4 sqrt(3)/4 -sqrt(3)/4
                0         0         0
                ];
            
            obj.Points = V .* obj.size;

            obj.Points = [obj.Points; ones(1, 3)];
            
            obj.h = fill3( obj.Points(1, :), obj.Points(2,:), obj.Points(3,:), color);
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

        function obj = translateWithRotation(obj, X, Y, Z, a)
            R = [ cos(a)  -sin(a) 0  0
                  sin(a)  cos(a)  0  0
                  0       0       1  0
                  0       0       0  1
                ];

            % Translation movement
            T = [ 1 0 0 X
                  0 1 0 Y
                  0 0 1 Z
                  0 0 0 1
                ];
            obj.Points = T*R*obj.Points;
                
            obj.h.XData = obj.Points(1,:);
            obj.h.YData = obj.Points(2,:);
            obj.h.ZData = obj.Points(3,:);
        end

        function [obj, dependentFaces] = rotate(obj, othersPoints, angle, dependentFaces)
            % Rotation movement
            commonPoints = [];
            for i=1:3
                for j=1:3
                    if and(and(abs(othersPoints(1, i) - obj.Points(1, j))<0.001, abs(othersPoints(2, i) - obj.Points(2, j))<0.001), abs(othersPoints(3, i) - obj.Points(3, j))<0.001)
                        commonPoints = [commonPoints othersPoints(:, i)];
                        break;
                    end
                end
            end
            axis = commonPoints(:,1) - commonPoints(:,2);
            axis = axis/sqrt(sum(axis.^2));

            R = [
                cos(angle) + axis(1).^2*(1-cos(angle))    axis(1)*axis(2)*(1-cos(angle)) - axis(3) * sin(angle)    axis(1)*axis(3)*(1-cos(angle))+axis(2)*sin(angle) 0
                axis(2)*axis(1)*(1-cos(angle))+axis(3)*sin(angle)    cos(angle)+axis(2).^2*(1-cos(angle))    axis(2)*axis(3)*(1-cos(angle))-axis(1)*sin(angle) 0
                axis(3)*axis(1)*(1-cos(angle))-axis(2)*sin(angle)    axis(3)*axis(2)*(1-cos(angle))+axis(1)*sin(angle)    cos(angle) + axis(3).^2*(1-cos(angle)) 0
                0 0 0 1
            ];

            obj = obj.translate(- commonPoints(1,1), - commonPoints(2,1), - commonPoints(3,1));
            obj.Points = R*obj.Points;
            obj = obj.translate( commonPoints(1,1),  commonPoints(2,1),  commonPoints(3,1));

            obj.h.XData = obj.Points(1,:);
            obj.h.YData = obj.Points(2,:);
            obj.h.ZData = obj.Points(3,:);

            if ~isempty(dependentFaces)
                for i=1:length(dependentFaces)
                    dependentFaces(i) = dependentFaces(i).translate(- commonPoints(1,1), - commonPoints(2,1), - commonPoints(3,1));
                    dependentFaces(i).Points = R*dependentFaces(i).Points;
                    dependentFaces(i) = dependentFaces(i).translate(commonPoints(1,1), commonPoints(2,1), commonPoints(3,1));
                end
            end
        end
    end
end

