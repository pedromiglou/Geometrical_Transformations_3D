classdef Cube
    % Class to represent the Cube solid
    
    properties
        faces
        size
    end
    
    methods
        function obj = Cube(R)
            % Construct an instance of this class
            obj.faces = [Square(R, 'm') Square(R, 'm') Square(R, 'm') ...
                Square(R, 'm') Square(R, 'm') Square(R, 'm')];

            obj.size = sqrt(2)*R;
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
            % translate entire cube
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X*f, Y*f, Z*f) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, f)
            % planificate cube
            obj.faces(1).points = trans(-obj.size*f, 0, 0) * obj.faces(1).points;
            obj.faces(3).points = trans(obj.size*f, 0, 0) * obj.faces(3).points;
            obj.faces(4).points = trans(2*obj.size*f, 0, 0) * obj.faces(4).points;
            obj.faces(5).points = trans(0, -obj.size*f, 0) * obj.faces(5).points;
            obj.faces(6).points = trans(0, obj.size*f, 0) * obj.faces(6).points;
        end

        function obj = close(obj, f)
            % close the cube with face 2 not moving
            xAngle = pi/2*f;

            obj.faces(1) = obj.faces(1).attach(xAngle, pi/2, [obj.faces(2).points(1:4,1) obj.faces(2).points(1:4,4)]);

            obj.faces(4) = obj.faces(4).attach(xAngle, 0, obj.faces(3).points(1:4,3:4));
            
            dependentFaces = [obj.faces(4)];
            [obj.faces(3), dependentFaces] = obj.faces(3).attach(xAngle, 3*pi/2, obj.faces(2).points(1:4,2:3), dependentFaces);
            obj.faces(4) = dependentFaces(1);

            obj.faces(5) = obj.faces(5).attach(xAngle, pi, obj.faces(2).points(1:4,1:2));

            obj.faces(6) = obj.faces(6).attach(xAngle, 0, obj.faces(2).points(1:4,3:4));
        end

        function obj = rotateAroundItself(obj, f)
            % rotate cube around itself
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
