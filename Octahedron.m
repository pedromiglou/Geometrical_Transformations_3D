
classdef Octahedron
    % Class to represent the Octahedron solid
    
    properties
        faces
        size
        height
    end
    
    methods
        function obj = Octahedron(size)
            % Construct an instance of this class
            obj.faces = [Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') ...
                        Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r') Triangle(size, 'r')];

            obj.size = sqrt(3)*size;
            obj.height = 3/2*size;
        end

        function obj = reset(obj)
            for i=1:length(obj.faces)
                obj.faces(i).points = obj.faces(i).initialPoints;
            end
        end
        
        function obj = translate(obj, X, Y, Z)
            % translate entire octahedron
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X, Y, Z) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, n, N)
            % planificate octahedron
            % invert some faces
            obj.faces(1).points = trans(0, obj.height, 0) * rotx(pi) * obj.faces(1).points;
            obj.faces(3).points = trans(0, obj.height, 0) * rotx(pi) * obj.faces(3).points;
            obj.faces(5).points = trans(0, obj.height, 0) * rotx(pi) * obj.faces(5).points;
            obj.faces(7).points = trans(0, obj.height, 0) * rotx(pi) * obj.faces(7).points;

            obj.faces(1).points = trans(0, -obj.height*n/N, 0) * obj.faces(1).points;
            obj.faces(2).points = trans(-obj.size*n/N, 0, 0) * obj.faces(2).points;
            obj.faces(3).points = trans(-obj.size/2*n/N, 0, 0) * obj.faces(3).points;
            obj.faces(4).points = trans(0, 0, 0) * obj.faces(4).points;
            obj.faces(5).points = trans(obj.size/2*n/N, 0, 0) * obj.faces(5).points;
            obj.faces(6).points = trans(obj.size*n/N, 0, 0) * obj.faces(6).points;
            obj.faces(7).points = trans(3*obj.size/2*n/N, 0, 0) * obj.faces(7).points;
            obj.faces(8).points = trans(obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(8).points;

            obj.faces(1) = obj.faces(1).update();
            obj.faces(2) = obj.faces(2).update();
            obj.faces(3) = obj.faces(3).update();
            obj.faces(4) = obj.faces(4).update();
            obj.faces(5) = obj.faces(5).update();
            obj.faces(6) = obj.faces(6).update();
            obj.faces(7) = obj.faces(7).update();
            obj.faces(8) = obj.faces(8).update();
        end

        function obj = close(obj, n, N)
            % close the octahedron with face 4 not moving
            obj.faces(1) = obj.faces(1).rotate((pi - acos(-1/3))*n/N);
            obj.faces(1) = obj.faces(1).rotateAroundItself(pi);
            obj.faces(1) = obj.faces(1).translate(obj.faces(4).points(1:4,1:2));

            obj.faces(2) = obj.faces(2).rotate((pi - acos(-1/3))*n/N);
            obj.faces(2) = obj.faces(2).rotateAroundItself(pi/3);
            obj.faces(2) = obj.faces(2).translate([obj.faces(3).points(1:4,1) obj.faces(3).points(1:4,3)]);

            dependentFaces = [obj.faces(2)];
            [obj.faces(3), dependentFaces] = obj.faces(3).rotate((pi - acos(-1/3))*n/N, dependentFaces);
            [obj.faces(3), dependentFaces] = obj.faces(3).rotateAroundItself(pi/3, dependentFaces);
            [obj.faces(3), dependentFaces] = obj.faces(3).translate([obj.faces(4).points(1:4,1) obj.faces(4).points(1:4,3)], dependentFaces);
            obj.faces(2) = dependentFaces(1);

            obj.faces(7) = obj.faces(7).rotate((pi - acos(-1/3))*n/N);
            obj.faces(7) = obj.faces(7).rotateAroundItself(pi/3);
            obj.faces(7) = obj.faces(7).translate([obj.faces(6).points(1:4,1) obj.faces(6).points(1:4,3)]);

            dependentFaces = [obj.faces(7)];
            [obj.faces(6), dependentFaces] = obj.faces(6).rotate((pi - acos(-1/3))*n/N, dependentFaces);
            [obj.faces(6), dependentFaces] = obj.faces(6).rotateAroundItself(5*pi/3, dependentFaces);
            [obj.faces(6), dependentFaces] = obj.faces(6).translate(obj.faces(5).points(1:4,2:3), dependentFaces);
            obj.faces(7) = dependentFaces(1);

            obj.faces(8) = obj.faces(8).rotate((pi - acos(-1/3))*n/N);
            obj.faces(8) = obj.faces(8).rotateAroundItself(pi/3);
            obj.faces(8) = obj.faces(8).translate([obj.faces(5).points(1:4,1) obj.faces(5).points(1:4,3)]);

            dependentFaces = [obj.faces(6) obj.faces(7) obj.faces(8)];
            [obj.faces(5), dependentFaces] = obj.faces(5).rotate((pi - acos(-1/3))*n/N, dependentFaces);
            [obj.faces(5), dependentFaces] = obj.faces(5).rotateAroundItself(5*pi/3, dependentFaces);
            [obj.faces(5), dependentFaces] = obj.faces(5).translate([obj.faces(4).points(1:4,3) obj.faces(4).points(1:4,2)], dependentFaces);
            obj.faces(6) = dependentFaces(1);
            obj.faces(7) = dependentFaces(2);
            obj.faces(8) = dependentFaces(3);
        end
    end
end
