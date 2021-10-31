classdef Octahedron
    % Class to represent the Octahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Octahedron(size)
            % Construct an instance of this class
            % all open cube vertices
            V = [
                3/2 0         1          2         3         1/2     3/2     5/2     7/2     2
                0   sqrt(3)/2 sqrt(3)/2  sqrt(3)/2 sqrt(3)/2 sqrt(3) sqrt(3) sqrt(3) sqrt(3) 3*sqrt(3)/2
                0   0         0          0         0         0       0       0       0       0
            ];

            % fixed face -> 4
            obj.faces = [Triangle(size, V(:,1), V(:,3), V(:,4), 'r') Triangle(size, V(:,2), V(:,3), V(:,6), 'r') ...
                Triangle(size, V(:,3), V(:,6), V(:,7), 'r') Triangle(size, V(:,3), V(:,4), V(:,7), 'r') ...
                Triangle(size, V(:,4), V(:,7), V(:,8), 'r') Triangle(size, V(:,4), V(:,5), V(:,8), 'r') ...
                Triangle(size, V(:,5), V(:,8), V(:,9), 'r') Triangle(size, V(:,7), V(:,8), V(:,10), 'r') ...
                ];
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

        function obj = close(obj)
            % close the octahedron
            N=100;
            
            for n=1:N
                obj.faces(1) = obj.faces(1).rotate(obj.faces(4).Points, (pi - acos(-1/3))/N, []);
                
                dependentFaces = [obj.faces(2)];
                [obj.faces(3), dependentFaces] = obj.faces(3).rotate(obj.faces(4).Points, (-pi + acos(-1/3))/N, dependentFaces);
                obj.faces(2) = dependentFaces(1);

                obj.faces(2) = obj.faces(2).rotate(obj.faces(3).Points, (-pi + acos(-1/3))/N, []);

                dependentFaces = [obj.faces(6) obj.faces(7) obj.faces(8)];
                [obj.faces(5), dependentFaces] = obj.faces(5).rotate(obj.faces(4).Points, (pi - acos(-1/3))/N, dependentFaces);
                obj.faces(6) = dependentFaces(1);
                obj.faces(7) = dependentFaces(2);
                obj.faces(8) = dependentFaces(3);

                obj.faces(8) = obj.faces(8).rotate(obj.faces(5).Points, (-pi + acos(-1/3))/N, []);

                dependentFaces = [obj.faces(7)];
                [obj.faces(6), dependentFaces] = obj.faces(6).rotate(obj.faces(5).Points, (pi - acos(-1/3))/N, dependentFaces);
                obj.faces(7) = dependentFaces(1);

                obj.faces(7) = obj.faces(7).rotate(obj.faces(6).Points, (pi - acos(-1/3))/N, []);

                pause(0.02)
            end
        end
    end
end

