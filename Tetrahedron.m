classdef Tetrahedron
    % Class to represent the Tetrahedron solid
    
    properties
        faces
        size
        height
    end
    
    methods
        function obj = Tetrahedron(size)
            % Construct an instance of a Tetrahedron
            obj.faces = [Triangle(size, 'y') Triangle(size, 'y') Triangle(size, 'y') Triangle(size, 'y')];

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
        
        function obj = translate(obj, X, Y, Z)
            % translate entire tetrahedron
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X, Y, Z) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, n, N)
            % planificate tetrahedron
            middlePoint = [obj.size/2, obj.height/3];
            invertedMiddlePoint = [obj.size/2, 2*obj.height/3];
            invertingMatrix = trans(invertedMiddlePoint(1)*n/N, invertedMiddlePoint(2)*n/N, 0) * rotz(pi*n/N) * trans(-middlePoint(1)*n/N, -middlePoint(2)*n/N, 0);
            
            obj.faces(1).points = trans(0, -obj.height*n/N, 0) * invertingMatrix * obj.faces(1).points;
            obj.faces(2).points = trans(-obj.size/2*n/N, 0, 0) * invertingMatrix * obj.faces(2).points;
            obj.faces(4).points = trans(obj.size/2*n/N, 0, 0) * invertingMatrix * obj.faces(4).points;
        end

        function obj = close(obj, n, N)
            % close the tetrahedron with face 3 not moving
            obj.faces(1) = obj.faces(1).attach((pi - acos(1/3))*n/N, pi, obj.faces(3).points(1:4,1:2));

            obj.faces(2) = obj.faces(2).attach((pi - acos(1/3))*n/N, pi/3, [obj.faces(3).points(1:4,1) obj.faces(3).points(1:4,3)]);

            obj.faces(4) = obj.faces(4).attach((pi - acos(1/3))*n/N, 5*pi/3, obj.faces(3).points(1:4,2:3));
        end
    end
end
