classdef Tetrahedron
    % Class to represent the Tetrahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Tetrahedron(size)
            % Construct an instance of this class
            % all open cube vertices
            V = [
                0 1 2 1/2       3/2       1 
                0 0 0 sqrt(3)/2 sqrt(3)/2 sqrt(3)
                0 0 0 0         0         0
            ];

            obj.faces = [Triangle(size, V(:,1), V(:,2), V(:,4), 'y') Triangle(size, V(:,2), V(:,4), V(:,5), 'y') ...
                Triangle(size, V(:,2), V(:,3), V(:,5), 'y') Triangle(size, V(:,4), V(:,5), V(:,6), 'y')];
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

        function obj = close(obj)
            % close the tetrahedron
            N=100;
            
            for n=1:N
                obj.faces(1) = obj.faces(1).rotate(obj.faces(2).Points, (-pi + acos(1/3))/N, []);
                
                obj.faces(3) = obj.faces(3).rotate(obj.faces(2).Points, (pi - acos(1/3))/N, []);

                obj.faces(4) = obj.faces(4).rotate(obj.faces(2).Points, (-pi + acos(1/3))/N, []);

                pause(0.02)
            end
        end
    end
end

