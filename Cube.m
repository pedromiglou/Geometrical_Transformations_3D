classdef Cube
    % Class to represent the Cube solid
    
    properties
        faces
        size
    end
    
    methods
        function obj = Cube(size)
            % Construct an instance of this class
            obj.faces = [Square(size, 'm') Square(size, 'm') Square(size, 'm') ...
                Square(size, 'm') Square(size, 'm') Square(size, 'm')];

            obj.size = sqrt(2)*size;
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
            % translate entire cube
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X, Y, Z) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, n, N)
            % planificate cube
            obj.faces(1).points = trans(-obj.size*n/N, 0, 0) * obj.faces(1).points;
            obj.faces(3).points = trans(obj.size*n/N, 0, 0) * obj.faces(3).points;
            obj.faces(4).points = trans(2*obj.size*n/N, 0, 0) * obj.faces(4).points;
            obj.faces(5).points = trans(0, -obj.size*n/N, 0) * obj.faces(5).points;
            obj.faces(6).points = trans(0, obj.size*n/N, 0) * obj.faces(6).points;
        end

        function obj = close(obj, n, N)
            % close the cube with face 2 not moving
            obj.faces(1) = obj.faces(1).attach(pi/2*n/N, pi/2, [obj.faces(2).points(1:4,1) obj.faces(2).points(1:4,4)]);

            obj.faces(4) = obj.faces(4).attach(pi/2*n/N, 0, obj.faces(3).points(1:4,3:4));
            
            dependentFaces = [obj.faces(4)];
            [obj.faces(3), dependentFaces] = obj.faces(3).attach(pi/2*n/N, 3*pi/2, obj.faces(2).points(1:4,2:3), dependentFaces);
            obj.faces(4) = dependentFaces(1);

            obj.faces(5) = obj.faces(5).attach(pi/2*n/N, pi, obj.faces(2).points(1:4,1:2));

            obj.faces(6) = obj.faces(6).attach(pi/2*n/N, 0, obj.faces(2).points(1:4,3:4));
        end
    end
end
