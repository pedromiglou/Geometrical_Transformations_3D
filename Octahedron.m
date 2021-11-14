classdef Octahedron
    % Class to represent the Octahedron solid
    
    properties
        faces
        size
        height
    end
    
    methods
        function obj = Octahedron(size)
            % Construct an instance of an Octahedron
            obj.faces = [Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') ...
                        Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r')];

            obj.size = sqrt(3)*size;
            obj.height = 3/2*size;
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
        
        function obj = translate(obj, X, Y, Z, n, N)
            % translate entire octahedron
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X*n/N, Y*n/N, Z*n/N) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, n, N)
            % planificate octahedron
            middlePoint = [obj.size/2, obj.height/3];
            invertedMiddlePoint = [obj.size/2, 2*obj.height/3];
            invertingMatrix = trans(invertedMiddlePoint(1), invertedMiddlePoint(2), 0) * rotz(pi*n/N) * trans(-middlePoint(1), -middlePoint(2), 0);

            obj.faces(1).points = trans(0, -obj.height*n/N, 0) * invertingMatrix * obj.faces(1).points;
            obj.faces(2).points = trans(-obj.size*n/N, 0, 0) * obj.faces(2).points;
            obj.faces(3).points = trans(-obj.size/2*n/N, 0, 0) * invertingMatrix * obj.faces(3).points;
            obj.faces(5).points = trans(obj.size/2*n/N, 0, 0) * invertingMatrix * obj.faces(5).points;
            obj.faces(6).points = trans(obj.size*n/N, 0, 0) * obj.faces(6).points;
            obj.faces(7).points = trans(3*obj.size/2*n/N, 0, 0) * invertingMatrix * obj.faces(7).points;
            obj.faces(8).points = trans(obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(8).points;
        end

        function obj = close(obj, n, N)
            % close the octahedron with face 4 not moving
            xAngle = (pi - acos(-1/3))*n/N;
            obj.faces(1) = obj.faces(1).attach(xAngle, pi, obj.faces(4).points(1:4,1:2));

            obj.faces(2) = obj.faces(2).attach(xAngle, pi/3, [obj.faces(3).points(1:4,1) obj.faces(3).points(1:4,3)]);

            dependentFaces = [obj.faces(2)];
            [obj.faces(3), dependentFaces] = obj.faces(3).attach(xAngle, pi/3, [obj.faces(4).points(1:4,1) obj.faces(4).points(1:4,3)], dependentFaces);
            obj.faces(2) = dependentFaces(1);

            obj.faces(7) = obj.faces(7).attach(xAngle, pi/3, [obj.faces(6).points(1:4,1) obj.faces(6).points(1:4,3)]);

            dependentFaces = [obj.faces(7)];
            [obj.faces(6), dependentFaces] = obj.faces(6).attach(xAngle, 5*pi/3, obj.faces(5).points(1:4,2:3), dependentFaces);
            obj.faces(7) = dependentFaces(1);

            obj.faces(8) = obj.faces(8).attach(xAngle, pi/3, [obj.faces(5).points(1:4,1) obj.faces(5).points(1:4,3)]);

            dependentFaces = [obj.faces(6) obj.faces(7) obj.faces(8)];
            [obj.faces(5), dependentFaces] = obj.faces(5).attach(xAngle, 5*pi/3, obj.faces(4).points(1:4,2:3), dependentFaces);
            obj.faces(6) = dependentFaces(1);
            obj.faces(7) = dependentFaces(2);
            obj.faces(8) = dependentFaces(3);
        end

        function obj = rotateAroundItself(obj, n, N)
            middlePoints = zeros(4, length(obj.faces));
            for i=1:length(obj.faces)
                middlePoints(:,i) = mean(obj.faces(i).points, 2);
            end

            middle = mean(middlePoints, 2);

            for i=1:length(obj.faces)
                obj.faces(i).points = trans(middle(1), middle(2), 0) * rotz(2*pi*n/N) * trans(-middle(1), -middle(2), 0) * obj.faces(i).points;
            end
        end
    end
end
