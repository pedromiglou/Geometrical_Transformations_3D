classdef Pentagon
    % Class to represent the Pentagon figure
    
    properties
        initialPoints
        points
        h
    end
    
    methods
        function obj = Pentagon(R, color)
            % Construct an instance of a Pentagon
            height = (1+cos(pi/5))*R;
            width = 2 * sin(2*pi/5)*R;
            size = 2*sin(pi/5)*R;

            aux = sqrt(3/4*size^2 + size*width/2 - width^2/4);

            obj.initialPoints = [
                0   size    size/2+width/2  size/2  size/2-width/2
                0   0       aux             height  aux
                0   0       0               0       0
                1   1       1               1       1
                ];
            
            obj.points = obj.initialPoints;
            
            obj.h = fill3(obj.points(1, :), obj.points(2,:), obj.points(3,:), color);
        end
        
        function [obj, dependentFaces] = attach(obj, xAngle, zAngle, newCoords, dependentFaces)
            % rotate figure around its edge that connects to other figure,
            % initially the X-axis
            obj.points = rotx(xAngle) * obj.points;

            % rotate around the Z-axis
            obj.points = rotz(zAngle) * obj.points;

            % translation movement to specific coordenates
            translation = mean(newCoords, 2) - mean(obj.points(:,1:2), 2);
            obj.points = trans(translation(1), translation(2), translation(3)) * obj.points;

            % repeat above operations for dependent faces
            if nargin>4
                for i=1:length(dependentFaces)
                    dependentFaces(i).points = rotx(xAngle) * dependentFaces(i).points;
                    dependentFaces(i).points = rotz(zAngle) * dependentFaces(i).points;
                    dependentFaces(i).points = trans(translation(1), translation(2), translation(3)) * dependentFaces(i).points;
                end
            end
        end

        function obj = update(obj)
            % update pentagon graphic representation
            obj.h.XData = obj.points(1,:);
            obj.h.YData = obj.points(2,:);
            obj.h.ZData = obj.points(3,:);
        end
    end
end
