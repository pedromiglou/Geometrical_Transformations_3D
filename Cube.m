classdef Cube
    % Class to represent the Cube solid
    
    properties
        faces
    end
    
    methods
        function obj = Cube(size)
            % Construct an instance of this class
            obj.faces = [Square(size, 'm') Square(size, 'm') Square(size, 'm') Square(size, 'm') Square(size, 'm') Square(size, 'm')];

            N=80;
            size = sqrt(2)*size;
            for i=1:N
                obj.faces(1) = obj.faces(1).translate(3*size/2/N, 5*size/2/N, 0);
                obj.faces(2) = obj.faces(2).translate(5*size/2/N, 5*size/2/N, 0);
                obj.faces(3) = obj.faces(3).translate(7*size/2/N, 5*size/2/N, 0);
                obj.faces(4) = obj.faces(4).translate(9*size/2/N, 5*size/2/N, 0);
                obj.faces(5) = obj.faces(5).translate(5*size/2/N, 3*size/2/N, 0);
                obj.faces(6) = obj.faces(6).translate(5*size/2/N, 7*size/2/N, 0);
                pause(0.02)
            end
        end

        function obj = translate(obj, X, Y, Z, N)
            % translate entire cube
            i = 1;
            while i<=length(obj.faces)
                obj.faces(i) = obj.faces(i).translate(X/N, Y/N, Z/N);
                i = i+1;
            end
        end

        function obj = close(obj, N)
            % close the cube
            obj.faces(1) = obj.faces(1).rotate(obj.faces(2).Points, -pi/2/N, []);
            
            dependentFaces = [obj.faces(4)];
            [obj.faces(3), dependentFaces] = obj.faces(3).rotate(obj.faces(2).Points, -pi/2/N, dependentFaces);
            obj.faces(4) = dependentFaces(1);

            obj.faces(4) = obj.faces(4).rotate(obj.faces(3).Points, -pi/2/N, []);

            obj.faces(5) = obj.faces(5).rotate(obj.faces(2).Points, pi/2/N, []);
            obj.faces(6) = obj.faces(6).rotate(obj.faces(2).Points, -pi/2/N, []);
            pause(0.02)
        end
    end
end

