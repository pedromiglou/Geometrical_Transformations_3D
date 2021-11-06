classdef Octahedron
    % Class to represent the Octahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Octahedron(size)
            % Construct an instance of this class
            obj.faces = [Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') ...
                        Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r')];

            size = sqrt(3*sqrt(3)/4)*size;
            N=80;

            obj.faces(1) = obj.faces(1).translateWithRotation(5*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(2) = obj.faces(2).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(3) = obj.faces(3).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(4) = obj.faces(4).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(5) = obj.faces(5).translateWithRotation(3*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(6) = obj.faces(6).translateWithRotation(7*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(7) = obj.faces(7).translateWithRotation(4*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(8) = obj.faces(8).translateWithRotation(3*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            pause(0.02)

            for i=2:N
                obj.faces(1) = obj.faces(1).translateWithRotation(5*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(2) = obj.faces(2).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(3) = obj.faces(3).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(4) = obj.faces(4).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(5) = obj.faces(5).translateWithRotation(3*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(6) = obj.faces(6).translateWithRotation(7*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(7) = obj.faces(7).translateWithRotation(4*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(8) = obj.faces(8).translateWithRotation(3*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                pause(0.02)
            end
        end
        
        function obj = translate(obj, X, Y, Z)
            % translate entire octahedron
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

        function obj = close(obj, N)
            % close the octahedron
            obj.faces(1) = obj.faces(1).rotate(obj.faces(4).Points, (pi - acos(-1/3))/N, []);
            
            dependentFaces = [obj.faces(2)];
            [obj.faces(3), dependentFaces] = obj.faces(3).rotate(obj.faces(4).Points, (-pi + acos(-1/3))/N, dependentFaces);
            obj.faces(2) = dependentFaces(1);

            obj.faces(2) = obj.faces(2).rotate(obj.faces(3).Points, (pi - acos(-1/3))/N, []);

            dependentFaces = [obj.faces(6) obj.faces(7) obj.faces(8)];
            [obj.faces(5), dependentFaces] = obj.faces(5).rotate(obj.faces(4).Points, (pi - acos(-1/3))/N, dependentFaces);
            obj.faces(6) = dependentFaces(1);
            obj.faces(7) = dependentFaces(2);
            obj.faces(8) = dependentFaces(3);

            obj.faces(8) = obj.faces(8).rotate(obj.faces(5).Points, (pi - acos(-1/3))/N, []);

            dependentFaces = [obj.faces(7)];
            [obj.faces(6), dependentFaces] = obj.faces(6).rotate(obj.faces(5).Points, (-pi + acos(-1/3))/N, dependentFaces);
            obj.faces(7) = dependentFaces(1);

            obj.faces(7) = obj.faces(7).rotate(obj.faces(6).Points, (pi - acos(-1/3))/N, []);
        end
    end
end

