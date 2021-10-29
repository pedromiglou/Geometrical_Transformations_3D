classdef Tetrahedron
    % Class to represent the Tetrahedron solid
    
    properties
        faces
    end
    
    methods
        function obj = Tetrahedron(size)
            % Construct an instance of this class
            obj.faces = [Triangle(size, 1/2, -sqrt(3)/2, 0, pi, 0, 0), Triangle(size, 1, 0, 0, 0, 0, 0), Triangle(size, 3/2, -sqrt(3)/2, 0, pi, 0, 0) ...
                Triangle(size, 1, 0, 0, pi, 0, 0)];
        end
        
        function obj = move(obj, path)
            % move cube
            for i=1:6
                obj.faces(i) = obj.faces(i).move(path);
            end
        end

        function obj = moveSlowly(obj, path)
            % move cube
            N=100;
            for n=1:N
                obj = obj.move(path/N);
                pause(0.02)
            end
        end

        function obj = close(obj)
            N=100;
            
            for n=1:N
                obj.faces(1) = obj.faces(1).move([0 0 0  0  0 -pi/6]);
                obj.faces(1) = obj.faces(1).move([0 0 0  0 7*pi/12 0]/N);
                obj.faces(1) = obj.faces(1).move([0 0 0  0  0 pi/6]);
                %obj.faces(3) = obj.faces(3).move([-1 0 0  0 0 0]);
                %obj.faces(3) = obj.faces(3).move([0 0 0  0 -pi/2 0]/N);
                %obj.faces(3) = obj.faces(3).move([1 0 0  0 0 0]);
                obj.faces(4) = obj.faces(4).move([0 0 0 7*pi/12 0  0]/N);
                pause(0.02)
            end
        end
    end
end

