classdef Cube
    % Class to represent the Cube solid
    
    properties
        faces
    end
    
    methods
        function obj = Cube(size)
            % Construct an instance of this class

            % all open cube vertices
            V = [
                1 2 0 1 2 3 4 0 1 2 3 4 1 2
                0 0 1 1 1 1 1 2 2 2 2 2 3 3
                0 0 0 0 0 0 0 0 0 0 0 0 0 0
            ];

            obj.faces = [Square(size, V(:,3), V(:,4), V(:,9), V(:,8), 'm') Square(size, V(:,4), V(:,5), V(:,10), V(:,9), 'm') ...
                Square(size, V(:,5), V(:,6), V(:,11), V(:,10), 'm') Square(size, V(:,6), V(:,7), V(:,12), V(:,11), 'm') ...
                Square(size, V(:,9), V(:,10), V(:,14), V(:,13), 'm') Square(size, V(:,1), V(:,2), V(:,5), V(:,4), 'm')];
        end

        function obj = translate(obj, X, Y, Z)
            % translate entire cube
            N=100;
            for n=1:N
                i = 1;
                while i<=length(obj.faces)
                    obj.faces(i) = obj.faces(i).translate(X/N, Y/N, Z/N);
                    i = i+1;
                end
                pause(0.02)
            end
        end

        function obj = close(obj)
            % close the cube
            N=100;
            
            for n=1:N
                obj.faces(1) = obj.faces(1).rotate(obj.faces(2).Points, -pi/2/N, []);
                
                dependentFaces = [obj.faces(4)];
                [obj.faces(3), dependentFaces] = obj.faces(3).rotate(obj.faces(2).Points, pi/2/N, dependentFaces);
                obj.faces(4) = dependentFaces(1);

                obj.faces(4) = obj.faces(4).rotate(obj.faces(3).Points, pi/2/N, []);

                obj.faces(5) = obj.faces(5).rotate(obj.faces(2).Points, -pi/2/N, []);
                obj.faces(6) = obj.faces(6).rotate(obj.faces(2).Points, pi/2/N, []);
                pause(0.02)
            end
        end
    end
end

