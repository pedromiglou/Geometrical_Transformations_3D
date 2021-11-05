classdef Tetrahedron
    % Class to represent the Tetrahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Tetrahedron(size)
            % Construct an instance of this class
            obj.faces = [Triangle(size, 'y') Triangle(size, 'y') Triangle(size, 'y') Triangle(size, 'y')];

            size = sqrt(3*sqrt(3)/2)*size;
            N=80;

            obj.faces(1) = obj.faces(1).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(2) = obj.faces(2).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(3) = obj.faces(3).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(4) = obj.faces(4).translateWithRotation(2*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            pause(0.02)

            for i=2:N
                obj.faces(1) = obj.faces(1).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(2) = obj.faces(2).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(3) = obj.faces(3).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(4) = obj.faces(4).translateWithRotation(2*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                pause(0.02)
            end
        end
        
        function obj = translate(obj, X, Y, Z)
            % translate entire tetrahedron
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
            % close the tetrahedron
            obj.faces(1) = obj.faces(1).rotate(obj.faces(2).Points, (pi - acos(1/3))/N, []);
            obj.faces(3) = obj.faces(3).rotate(obj.faces(2).Points, (-pi + acos(1/3))/N, []);
            obj.faces(4) = obj.faces(4).rotate(obj.faces(2).Points, (pi - acos(1/3))/N, []);
        end
    end
end

