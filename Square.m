classdef Square
    % Class to represent the Square figure
    
    properties
        initialPoints
        points
        h
        size
    end
    
    methods
        function obj = Square(size, color)
            % Construct an instance of a Square
            obj.size = sqrt(2)*size;

            obj.initialPoints = [
                0   obj.size    obj.size    0
                0   0           obj.size    obj.size
                0   0           0           0
                1   1           1           1
                ];

            obj.points = obj.initialPoints;

            obj.h = fill3(obj.points(1, :), obj.points(2,:), obj.points(3,:), color);
        end
        
        function [obj, dependentFaces] = attach(obj, xAngle, zAngle, newCoords, dependentFaces)
            % rotate figure around its edge that connects to other figure,
            % initially the X-axis
            obj.points = rotx(xAngle) * obj.points;

            % rotate around itself
            middle = mean(obj.points, 2);
            obj.points = rotz(zAngle) * trans(-middle(1), -middle(2), 0) * obj.points;

            % translation movement to specific coordenates
            translation = mean(newCoords, 2) - mean(obj.points(:,1:2), 2);
            obj.points = trans(translation(1), translation(2), translation(3)) * obj.points;

            % repeat above operations for dependent faces
            if nargin>4
                for i=1:length(dependentFaces)
                    dependentFaces(i).points = rotx(xAngle) * dependentFaces(i).points;
                    dependentFaces(i).points = rotz(zAngle) * trans(-middle(1), -middle(2), 0) * dependentFaces(i).points;
                    dependentFaces(i).points = trans(translation(1), translation(2), translation(3)) * dependentFaces(i).points;
                end
            end
        end

        function obj = update(obj)
            % update square graphic representation
            obj.h.XData = obj.points(1,:);
            obj.h.YData = obj.points(2,:);
            obj.h.ZData = obj.points(3,:);
        end
    end
end
