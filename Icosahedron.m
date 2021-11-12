classdef Icosahedron
    % Class to represent the Icosahedron solid
    
    properties
        faces
        size
        height
    end
    
    methods
        function obj = Icosahedron(size)
            % Construct an instance of an Icosahedron
            obj.faces = [Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b')];

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
            % translate entire icosahedron
            for i=1:length(obj.faces)
                obj.faces(i).points = trans(X, Y, Z) * obj.faces(i).points;
            end
        end

        function obj = planificate(obj, n, N)
            % planificate icosahedron
            obj.faces(1).points = trans(-2*obj.size*n/N, -obj.height*n/N, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(1).points;
            obj.faces(2).points = trans(-obj.size*n/N, -obj.height*n/N, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(2).points;
            obj.faces(3).points = trans(0, -obj.height*n/N, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(3).points;
            obj.faces(4).points = trans(obj.size*n/N, -obj.height*n/N, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(4).points;
            obj.faces(5).points = trans(2*obj.size*n/N, -obj.height*n/N, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(5).points;
            obj.faces(6).points = trans(-2*obj.size*n/N, 0, 0) * obj.faces(6).points;
            obj.faces(7).points = trans(-3*obj.size/2*n/N, 0, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(7).points;
            obj.faces(8).points = trans(-obj.size*n/N, 0, 0) * obj.faces(8).points;
            obj.faces(9).points = trans(-obj.size/2*n/N, 0, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(9).points;
            obj.faces(11).points = trans(obj.size/2*n/N, 0, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(11).points;
            obj.faces(12).points = trans(obj.size*n/N, 0, 0) * obj.faces(12).points;
            obj.faces(13).points = trans(3*obj.size/2*n/N, 0, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(13).points;
            obj.faces(14).points = trans(2*obj.size*n/N, 0, 0) * obj.faces(14).points;
            obj.faces(15).points = trans(5*obj.size/2*n/N, 0, 0) * trans(0, obj.height, 0) * rotx(pi) * obj.faces(15).points;
            obj.faces(16).points = trans(-3*obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(16).points;
            obj.faces(17).points = trans(-obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(17).points;
            obj.faces(18).points = trans(obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(18).points;
            obj.faces(19).points = trans(3*obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(19).points;
            obj.faces(20).points = trans(5*obj.size/2*n/N, obj.height*n/N, 0) * obj.faces(20).points;
        end

        function obj = close(obj, n, N)
            % close the icosahedron with face 10 not moving
            obj.faces(3) = obj.faces(3).attach((pi - acos(-sqrt(5)/3))*n/N, pi, obj.faces(10).points(1:4,1:2));

            obj.faces(1) = obj.faces(1).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(6).points(1:4,1) obj.faces(6).points(1:4,3)]);

            dependentFaces = [obj.faces(1)];
            [obj.faces(6), dependentFaces] = obj.faces(6).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(7).points(1:4,1) obj.faces(7).points(1:4,3)], dependentFaces);
            obj.faces(1) = dependentFaces(1);

            obj.faces(16) = obj.faces(16).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(7).points(1:4,2:3));

            dependentFaces = [obj.faces(1) obj.faces(6) obj.faces(16)];
            [obj.faces(7), dependentFaces] = obj.faces(7).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(8).points(1:4,2:3), dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(6) = dependentFaces(2);
            obj.faces(16) = dependentFaces(3);

            obj.faces(2) = obj.faces(2).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(8).points(1:4,1) obj.faces(8).points(1:4,3)]);

            dependentFaces = [obj.faces(1) obj.faces(2) obj.faces(6) obj.faces(7) obj.faces(16)];
            [obj.faces(8), dependentFaces] = obj.faces(8).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(9).points(1:4,1) obj.faces(9).points(1:4,3)], dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(2) = dependentFaces(2);
            obj.faces(6) = dependentFaces(3);
            obj.faces(7) = dependentFaces(4);
            obj.faces(16) = dependentFaces(5);

            obj.faces(17) = obj.faces(17).attach((pi - acos(-sqrt(5)/3))*n/N, 5/3*pi, obj.faces(9).points(1:4,2:3));

            dependentFaces = [obj.faces(1) obj.faces(2) obj.faces(6) obj.faces(7) obj.faces(8) obj.faces(16) obj.faces(17)];
            [obj.faces(9), dependentFaces] = obj.faces(9).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(10).points(1:4,1) obj.faces(10).points(1:4,3)], dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(2) = dependentFaces(2);
            obj.faces(6) = dependentFaces(3);
            obj.faces(7) = dependentFaces(4);
            obj.faces(8) = dependentFaces(5);
            obj.faces(16) = dependentFaces(6);
            obj.faces(17) = dependentFaces(7);

            obj.faces(20) = obj.faces(20).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(15).points(1:4,1) obj.faces(15).points(1:4,3)]);

            dependentFaces = [ obj.faces(20)];
            [obj.faces(15), dependentFaces] = obj.faces(15).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(14).points(1:4,1) obj.faces(14).points(1:4,3)], dependentFaces);
            obj.faces(20) = dependentFaces(1);

            obj.faces(5) = obj.faces(5).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(13).points(1:4,2:3));

            dependentFaces = [obj.faces(5) obj.faces(15) obj.faces(20)];
            [obj.faces(14), dependentFaces] = obj.faces(14).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(13).points(1:4,2:3), dependentFaces);
            obj.faces(5) = dependentFaces(1);
            obj.faces(15) = dependentFaces(2);
            obj.faces(20) = dependentFaces(3);

            obj.faces(19) = obj.faces(19).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(13).points(1:4,1) obj.faces(13).points(1:4,3)]);

            dependentFaces = [obj.faces(5) obj.faces(14) obj.faces(15) obj.faces(19) obj.faces(20)];
            [obj.faces(13), dependentFaces] = obj.faces(13).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(12).points(1:4,1) obj.faces(12).points(1:4,3)], dependentFaces);
            obj.faces(5) = dependentFaces(1);
            obj.faces(14) = dependentFaces(2);
            obj.faces(15) = dependentFaces(3);
            obj.faces(19) = dependentFaces(4);
            obj.faces(20) = dependentFaces(5);

            obj.faces(4) = obj.faces(4).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(12).points(1:4,2:3));

            dependentFaces = [obj.faces(4) obj.faces(5) obj.faces(13) obj.faces(14) obj.faces(15) obj.faces(19) obj.faces(20)];
            [obj.faces(12), dependentFaces] = obj.faces(12).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(11).points(1:4,2:3), dependentFaces);
            obj.faces(4) = dependentFaces(1);
            obj.faces(5) = dependentFaces(2);
            obj.faces(13) = dependentFaces(3);
            obj.faces(14) = dependentFaces(4);
            obj.faces(15) = dependentFaces(5);
            obj.faces(19) = dependentFaces(6);
            obj.faces(20) = dependentFaces(7);

            obj.faces(18) = obj.faces(18).attach((pi - acos(-sqrt(5)/3))*n/N, pi/3, [obj.faces(11).points(1:4,1) obj.faces(11).points(1:4,3)]);

            dependentFaces = [obj.faces(4) obj.faces(5) obj.faces(12) obj.faces(13) obj.faces(14) obj.faces(15) obj.faces(18) obj.faces(19) obj.faces(20)];
            [obj.faces(11), dependentFaces] = obj.faces(11).attach((pi - acos(-sqrt(5)/3))*n/N, 5*pi/3, obj.faces(10).points(1:4,2:3), dependentFaces);
            obj.faces(4) = dependentFaces(1);
            obj.faces(5) = dependentFaces(2);
            obj.faces(12) = dependentFaces(3);
            obj.faces(13) = dependentFaces(4);
            obj.faces(14) = dependentFaces(5);
            obj.faces(15) = dependentFaces(6);
            obj.faces(18) = dependentFaces(7);
            obj.faces(19) = dependentFaces(8);
            obj.faces(20) = dependentFaces(9);
        end
    end
end
