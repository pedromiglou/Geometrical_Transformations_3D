classdef Tetrahedron
    % Class to represent the Tetrahedron solid
    
    properties
        faces
        size
        height
    end
    
    methods
        function obj = Tetrahedron(R)
            % Construct an instance of a Tetrahedron
            obj.faces = [Triangle(R, 'y') Triangle(R, 'y') Triangle(R, 'y') Triangle(R, 'y')];

            obj.size = sqrt(3)*R;
            obj.height = 3/2*R;
        end

        function obj = reset(obj)
            % reset faces coordinates
            for i=1:length(obj.faces)
                obj.faces(i).points = obj.faces(i).initialPoints;
            end
        end

        function obj = update(obj)
            % update faces graphic representation
            for i=1:length(obj.faces)
                obj.faces(i) = obj.faces(i).update();
            end
        end
        
        function obj = translate(obj, X, Y, Z, f)
            % translate entire tetrahedron
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X*f, Y*f, Z*f) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, f)
            % planificate tetrahedron
            middlePoint = [obj.size/2, obj.height/3];
            invertedMiddlePoint = [obj.size/2, 2*obj.height/3];
            invertingMatrix = (f*trans(invertedMiddlePoint(1), invertedMiddlePoint(2), 0) + (1-f) * trans(middlePoint(1), middlePoint(2), 0)) * rotz(pi*f) * trans(-middlePoint(1), -middlePoint(2), 0);
            
            obj.faces(1).points = trans(0, -obj.height*f, 0) * invertingMatrix * obj.faces(1).points;
            obj.faces(2).points = trans(-obj.size/2*f, 0, 0) * invertingMatrix * obj.faces(2).points;
            obj.faces(4).points = trans(obj.size/2*f, 0, 0) * invertingMatrix * obj.faces(4).points;
        end

        function obj = close(obj, f)
            % close the tetrahedron with face 3 not moving
            xAngle = (pi - acos(1/3))*f;

            obj.faces(1) = obj.faces(1).attach(xAngle, pi, obj.faces(3).points(1:4,1:2));

            obj.faces(2) = obj.faces(2).attach(xAngle, pi/3, [obj.faces(3).points(1:4,1) obj.faces(3).points(1:4,3)]);

            obj.faces(4) = obj.faces(4).attach(xAngle, 5*pi/3, obj.faces(3).points(1:4,2:3));
        end

        function obj = rotateAroundItself(obj, f)
            % rotate tetrahedron around itself
            middlePoints = zeros(4, length(obj.faces));
            for i=1:length(obj.faces)
                middlePoints(:,i) = mean(obj.faces(i).points, 2);
            end

            middle = mean(middlePoints, 2);

            for i=1:length(obj.faces)
                obj.faces(i).points = trans(middle(1), middle(2), 0) * rotz(2*pi*f) * trans(-middle(1), -middle(2), 0) * obj.faces(i).points;
            end
        end
    end
end
