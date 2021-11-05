classdef Icosahedron
    % Class to represent the Icosahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Icosahedron(size)
            % Construct an instance of this class
            obj.faces = [Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') ...
                        Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b') Triangle(size, 'b')];

            size = sqrt(3*sqrt(3)/2)*size;
            N=80;

            obj.faces(1) = obj.faces(1).translateWithRotation(3*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(2) = obj.faces(2).translateWithRotation(5*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(3) = obj.faces(3).translateWithRotation(7*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(4) = obj.faces(4).translateWithRotation(9*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(5) = obj.faces(5).translateWithRotation(11*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
            obj.faces(6) = obj.faces(6).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(7) = obj.faces(7).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(8) = obj.faces(8).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(9) = obj.faces(9).translateWithRotation(3*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(10) = obj.faces(10).translateWithRotation(7*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(11) = obj.faces(11).translateWithRotation(4*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(12) = obj.faces(12).translateWithRotation(9*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(13) = obj.faces(13).translateWithRotation(5*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(14) = obj.faces(14).translateWithRotation(11*size/2/N, 5*sqrt(3)*size/4/N, 0, pi);
            obj.faces(15) = obj.faces(15).translateWithRotation(6*size/N, 5*sqrt(3)*size/4/N, 0, 0);
            obj.faces(16) = obj.faces(16).translateWithRotation(2*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            obj.faces(17) = obj.faces(17).translateWithRotation(3*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            obj.faces(18) = obj.faces(18).translateWithRotation(4*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            obj.faces(19) = obj.faces(19).translateWithRotation(5*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            obj.faces(20) = obj.faces(20).translateWithRotation(6*size/N, 7*sqrt(3)*size/4/N, 0, pi);
            pause(0.02)

            for i=2:N
                obj.faces(1) = obj.faces(1).translateWithRotation(3*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(2) = obj.faces(2).translateWithRotation(5*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(3) = obj.faces(3).translateWithRotation(7*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(4) = obj.faces(4).translateWithRotation(9*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(5) = obj.faces(5).translateWithRotation(11*size/2/N, 3*sqrt(3)*size/4/N, 0, 0);
                obj.faces(6) = obj.faces(6).translateWithRotation(3*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(7) = obj.faces(7).translateWithRotation(2*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(8) = obj.faces(8).translateWithRotation(5*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(9) = obj.faces(9).translateWithRotation(3*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(10) = obj.faces(10).translateWithRotation(7*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(11) = obj.faces(11).translateWithRotation(4*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(12) = obj.faces(12).translateWithRotation(9*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(13) = obj.faces(13).translateWithRotation(5*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(14) = obj.faces(14).translateWithRotation(11*size/2/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(15) = obj.faces(15).translateWithRotation(6*size/N, 5*sqrt(3)*size/4/N, 0, 0);
                obj.faces(16) = obj.faces(16).translateWithRotation(2*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                obj.faces(17) = obj.faces(17).translateWithRotation(3*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                obj.faces(18) = obj.faces(18).translateWithRotation(4*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                obj.faces(19) = obj.faces(19).translateWithRotation(5*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                obj.faces(20) = obj.faces(20).translateWithRotation(6*size/N, 7*sqrt(3)*size/4/N, 0, 0);
                pause(0.02)
            end
        end
        
        function obj = translate(obj, X, Y, Z)
            % translate entire icosahedron
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
            % close the icosahedron
            obj.faces(3) = obj.faces(3).rotate(obj.faces(10).Points, (pi - acos(-sqrt(5)/3))/N, []);
            
            dependentFaces = [obj.faces(1) obj.faces(2) obj.faces(6) obj.faces(7) obj.faces(8) obj.faces(16) obj.faces(17)];
            [obj.faces(9), dependentFaces] = obj.faces(9).rotate(obj.faces(10).Points, (-pi + acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(2) = dependentFaces(2);
            obj.faces(6) = dependentFaces(3);
            obj.faces(7) = dependentFaces(4);
            obj.faces(8) = dependentFaces(5);
            obj.faces(16) = dependentFaces(6);
            obj.faces(17) = dependentFaces(7);

            obj.faces(17) = obj.faces(17).rotate(obj.faces(9).Points, (pi - acos(-sqrt(5)/3))/N, []);
            
            dependentFaces = [obj.faces(1) obj.faces(2) obj.faces(6) obj.faces(7) obj.faces(16)];
            [obj.faces(8), dependentFaces] = obj.faces(8).rotate(obj.faces(9).Points, (pi - acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(2) = dependentFaces(2);
            obj.faces(6) = dependentFaces(3);
            obj.faces(7) = dependentFaces(4);
            obj.faces(16) = dependentFaces(5);


            obj.faces(2) = obj.faces(2).rotate(obj.faces(8).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [obj.faces(1) obj.faces(6) obj.faces(16)];
            [obj.faces(7), dependentFaces] = obj.faces(7).rotate(obj.faces(8).Points, (-pi + acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(1) = dependentFaces(1);
            obj.faces(6) = dependentFaces(2);
            obj.faces(16) = dependentFaces(3);

            obj.faces(16) = obj.faces(16).rotate(obj.faces(7).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [obj.faces(1)];
            [obj.faces(6), dependentFaces] = obj.faces(6).rotate(obj.faces(7).Points, (pi - acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(1) = dependentFaces(1);

            obj.faces(1) = obj.faces(1).rotate(obj.faces(6).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [obj.faces(4) obj.faces(5) obj.faces(11) obj.faces(12) obj.faces(13) obj.faces(14) obj.faces(15) obj.faces(18) obj.faces(19) obj.faces(20)];
            [obj.faces(11), dependentFaces] = obj.faces(11).rotate(obj.faces(10).Points, (pi - acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(4) = dependentFaces(1);
            obj.faces(5) = dependentFaces(2);
            obj.faces(11) = dependentFaces(3);
            obj.faces(12) = dependentFaces(4);
            obj.faces(13) = dependentFaces(5);
            obj.faces(14) = dependentFaces(6);
            obj.faces(15) = dependentFaces(7);
            obj.faces(18) = dependentFaces(8);
            obj.faces(19) = dependentFaces(9);
            obj.faces(20) = dependentFaces(10);

            obj.faces(18) = obj.faces(18).rotate(obj.faces(11).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [obj.faces(4) obj.faces(5) obj.faces(13) obj.faces(14) obj.faces(15) obj.faces(19) obj.faces(20)];
            [obj.faces(12), dependentFaces] = obj.faces(12).rotate(obj.faces(11).Points, (-pi + acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(4) = dependentFaces(1);
            obj.faces(5) = dependentFaces(2);
            obj.faces(13) = dependentFaces(3);
            obj.faces(14) = dependentFaces(4);
            obj.faces(15) = dependentFaces(5);
            obj.faces(19) = dependentFaces(6);
            obj.faces(20) = dependentFaces(7);

            obj.faces(4) = obj.faces(4).rotate(obj.faces(12).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [ obj.faces(5) obj.faces(14) obj.faces(15) obj.faces(19) obj.faces(20)];
            [obj.faces(13), dependentFaces] = obj.faces(13).rotate(obj.faces(12).Points, (pi - acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(5) = dependentFaces(1);
            obj.faces(14) = dependentFaces(2);
            obj.faces(15) = dependentFaces(3);
            obj.faces(19) = dependentFaces(4);
            obj.faces(20) = dependentFaces(5);

            obj.faces(19) = obj.faces(19).rotate(obj.faces(13).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [ obj.faces(5) obj.faces(15) obj.faces(20)];
            [obj.faces(14), dependentFaces] = obj.faces(14).rotate(obj.faces(13).Points, (-pi + acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(5) = dependentFaces(1);
            obj.faces(15) = dependentFaces(2);
            obj.faces(20) = dependentFaces(3);

            obj.faces(5) = obj.faces(5).rotate(obj.faces(14).Points, (pi - acos(-sqrt(5)/3))/N, []);

            dependentFaces = [ obj.faces(20)];
            [obj.faces(15), dependentFaces] = obj.faces(15).rotate(obj.faces(14).Points, (pi - acos(-sqrt(5)/3))/N, dependentFaces);
            obj.faces(20) = dependentFaces(1);

            obj.faces(20) = obj.faces(20).rotate(obj.faces(15).Points, (pi - acos(-sqrt(5)/3))/N, []);
        end
    end
end
